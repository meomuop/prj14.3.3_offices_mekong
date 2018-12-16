<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
	ini_set('display_errors',0);
	session_start();
	
	// --- Check user is login ------
	if (!isset($_SESSION['user_id'])){
		// Error: goto login page - Login Error
		//redirect("login.php");
		header("location: ".$http_root."login.php");
	}
	
	require_once("../includes/ad_requires.php");
	require_once($CLASSES_PATH."clsModule.php");
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH."clsObjects.php");
	require_once($CLASSES_PATH."clsUnits.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	require_once($CLASSES_PATH.'clsMsgUsers.php');
	require_once($CLASSES_PATH.'clsMsgs.php');
	require_once($CLASSES_PATH.'clsHdsds.php');
	//include("../phpjobscheduler/firepjs.php");	
	
	
	$vars = array_merge($_POST,$_GET, $_FILES);
	$obj = new module_class();
	$obj ->checkmodules();
	//Get module name
	$module_name = $vars['mod'];
	if($module_name !=""):
		$ismodname = $obj ->checkmodname($module_name);
		if(!isset($ismodname)):
			redirect("?");
		else:
		$module_name = $module_name."/";
		endif;
	endif;
	
	//$dbconn->debug = true;
		
	//Get user modules permission
	$obj_user = new users_class();
	$user_mod_01 = $obj_user->check_mod($_SESSION["user_id"],1);
	$user_mod_02 = $obj_user->check_mod($_SESSION["user_id"],2);
	$obj_user->getDBbyPkey($_SESSION["user_id"]);
	
	//Get list level 4 user
	$obj_user_4 = new users_class();
	$where_4 = "1=1 and user_active = 1 and user_level in(3,4,5)";
	$user_list_4 = $obj_user_4->getDBList($where_4, "user_sort", FALSE, " ");
	
	$obj_hdsd = new hdsd_class();
	$where_hdsd = "1=1 and hdsd_active = 1";
	$hdsd_list = $obj_hdsd->getDBList($where_hdsd, "hdsd_sort", FALSE, " ");
	
	$assign_list = array();
	$assign_list['hdsd_list'] 	= $hdsd_list;
	
	// user informations
	$assign_list['user_list_4'] 		= $user_list_4;
	$assign_list['module_list_user'] 	= $module_list_user;
	$assign_list['user_image'] 			= $_SESSION["user_image"];
	$assign_list['user_level'] 			= $_SESSION["user_level"];
	$assign_list['user_level_tnvb'] 	= $_SESSION["user_level_tnvb"];
	$assign_list['user_module'] 		= $_SESSION["user_module"];
	$assign_list['access_user_id'] 		= $_SESSION["user_id"];
	$assign_list['access_user_name'] 	= $_SESSION["user_name"];
	$assign_list['access_user_fullname'] 	= $_SESSION["user_fullname"];
	$assign_list['access_user_pass_encode'] = $obj_user->user_encode_pass;
	
	$obj_unit 		= new unit_class();
	$unit_name		= $obj_unit->getTitle($obj_user->unit_id);
	$_SESSION['access_unit_id'] 		= $obj_user->unit_id;
	$assign_list['access_unit_id'] 		= $obj_user->unit_id;
	$assign_list['access_unit_name'] 	= $unit_name;
	
	$obj_object 	= new object_class();
	$object_name	= $obj_object->getTitle($obj_user->object_id);
	$assign_list['access_object_id'] 	= $obj_user->object_id;
	$assign_list['access_object_name'] 	= $object_name;
	
	$obj_department = new department_class();
	$department_name= $obj_department->getTitle($obj_user->unit_id);
	$_SESSION['access_department_id'] = $obj_user->department_id;
	$assign_list['access_department_name'] = $department_name;
	$assign_list['access_department_id'] = $_SESSION['access_department_id'];
	
	$obj_list_department = $obj_department->getDBList(" department_active=1", "department_sort", FALSE, "");
	$assign_list['obj_list_department'] = $obj_list_department;
	
	$obj_index_object = $obj_object->getDBList(" object_active=1", "object_sort", FALSE, "");
	$assign_list['obj_index_object'] = $obj_index_object;
	
	// permissions
	$assign_list['per_add'] 	= 1;
	$assign_list['per_edit'] 	= 1;
	$assign_list['per_del'] 	= 1;
	$assign_list['per_act'] 	= 1;
	$assign_list['per_view'] 	= 1;
	$assign_list['http_root'] 	= $http_root;
		
	// count new msg
	$obj_msgUser = new msgUser_class();
	$where_msgUser = "1 = 1  AND msg_id in(select msg_id from tbl_msgs) and msgUser_active != 1 and user_id = ".$_SESSION['user_id'];
	$count_msg = $obj_msgUser->getRowNumber("$where_msgUser");
	$assign_list['count_msg'] 	= $count_msg;
	
	//owner information
	require_once($CLASSES_PATH.'clsConfig.php');
	$owner =  new  config_class();
	$where_owner = "  1 = 1 ";
	$obj_owner = $owner->getDBList( $where_owner , "", true , " Limit 1");
	$assign_list['obj_owner'] = $obj_owner;
	
	//----------duong dan
	$css_path = '../js/jquery/draggable_div/images/';
	$css_img_bg = '../css/admin/img/';
    $css_btn_bg = '../css/admin/buttons/';
	$assign_list['css_path'] = $css_path;
	$assign_list['css_img_bg'] = $css_img_bg;
    $assign_list['css_btn_bg'] = $css_btn_bg;
	
	//----------db year
	$assign_list['db_year'] = $_SESSION['db_year'];
		
	$smarty->assign($assign_list);
	global $key; // Key ---> is define in common file
	// Check url --> redirect to page
	switch ($key[0])
	{
		/*  -----------------------------------------------------------------------------------------------
			Module: QUAN TRI CAO CAP
			Bao gom cac muc quan ly:
				1. Cau hinh:										2. Nhan su:
					1.1. thong tin										2.1. nguoi dung
					1.2. cong sms										2.2. chuc vu
					1.3. email											2.3. phong/ban/chi nhanh/don vi
					1.4. ngay nghi										2.4. thang luong
					1.5. video huong dan
				
				3. Vat tu - thiet bi:								4. Lich bieu:
					3.1.												4.1.
					3.2.												4.2.
					3.3.												4.3.
					..........											..........
		*/
		// Muc 1:
		case 'editConfig': 	include ($MODULE_PATH.$module_name.'B_config_edit.php'); exit();
		case 'listPort': 	include ($MODULE_PATH.$module_name.'B_Port_list.php'); exit();
		case 'listHoliday': include ($MODULE_PATH.$module_name.'B_Holiday_list.php'); exit();
		case 'listHdsd': 	include ($MODULE_PATH.$module_name.'B_Hdsd_list.php'); exit();
		case 'viewHdsd': 	include ($MODULE_PATH.$module_name.'B_Hdsd_view.php'); exit();
		case 'backup_restore': include ('backup_restore.php'); exit();
		case 'sysreset': 	include ('sysreset.php'); exit();
		
		//case 'listModule': include ($MODULE_PATH.$module_name.'Admin.Module.list.php'); exit();
		//case 'editModule': include ($MODULE_PATH.$module_name.'Admin.Module.edit.php'); exit();
		
		
		// Muc 2:
		case 'listUser': 		include ($MODULE_PATH.$module_name.'B_User_list.php'); exit();
		case 'listDepartment': 	include ($MODULE_PATH.$module_name.'B_Department_list.php'); exit();
		case 'listObject': 		include ($MODULE_PATH.$module_name.'B_Object_list.php'); exit();
		case 'listTrinhdo': 	include ($MODULE_PATH.$module_name.'B_Trinhdo_list.php'); exit();
		case 'listThangluong': 	include ($MODULE_PATH.$module_name.'B_Thangluong_list.php'); exit();
		
		// Muc 3:
		case 'listVTTB_Chung': 	include ($MODULE_PATH.$module_name.'B_Vttb_chung_list.php'); exit();
		case 'addEditVTTBCat': 	include ($MODULE_PATH.$module_name.'B_Vttb_cat_add_edit.php'); exit();
		case 'addEditVTTBSub': 	include ($MODULE_PATH.$module_name.'B_Vttb_sub_add_edit.php'); exit();
		case 'addEditVTTB': 	include ($MODULE_PATH.$module_name.'B_Vttb_add_edit.php'); exit();
		case 'listRepare': 		include ($MODULE_PATH.$module_name.'B_Repare_list.php'); exit();
		case 'listReplace': 	include ($MODULE_PATH.$module_name.'B_Replace_list.php'); exit();
		case 'listDatlich': 	include ($MODULE_PATH.$module_name.'B_Datlich_list.php'); exit();
		case 'viewVTTB': 		include ($MODULE_PATH.$module_name.'B_Vttb_view.php'); exit();
		case 'checkDatlich': 	include ($MODULE_PATH.$module_name.'B_check_lich.php'); exit();
		
		// Muc 4:
		case 'mainPlan': 		include ($MODULE_PATH.$module_name.'B_Plan_main.php'); exit();
		case 'addEditPlanCat': 	include ($MODULE_PATH.$module_name.'B_PlanCat_add_edit.php'); exit();
		case 'addEditPlan': 	include ($MODULE_PATH.$module_name.'B_Plan_add_edit.php'); exit();
		case 'expPlanReport': 	include ($MODULE_PATH.$module_name.'B_PlanReport_exp.php'); exit();
		
		/*  -----------------------------------------------------------------------------------------------
			Module: DANH MUC CHUC NANG
			Quan ly van ban (dieu hanh noi bo):	
				1. Thuoc tinh:								|	2. Thao tac quan ly
					1.1. chung loai							|		2.1. quan ly van ban den
					1.2. linh vuc							|			2.1.1. d/s, them, sua, xoa
					1.3. khu vuc (co autocomplete)			|			2.1.2. d/s vb phan loai cua cvp
					1.4. do khan							|			2.1.3. phan loai
					1.5. do mat								|			2.1.4. d/s chi dao, them, sua, xoa
					1.6. chuc vu chung						|			2.1.5. d/s vb truong/pho phong
					1.7. nguoi ky							|			2.1.6. d/s vb chuyen vien
					1.8. nguoi ky lien nganh				|			2.1.7. giai quyet
					1.9. cac don vi							|			2.1.8. d/s vb phoi hop
					1.10. han xu ly							|			2.1.9. chi dao phoi hop
					1.11. d/s han cu ly						|			2.1.10. xem thong tin van ban
																		2.1.11. ket xuat bao cao
																		2.1.12. van ban qua han
																		2.1.13. ket xuat van qua han
																		2.1.14. tep tin dinh kem
																		2.1.15. ket xuat van qua han
				2. Tiep	thao tac quan ly												
					2.2. quan ly van ban di					|		2.3. truyen nhan van ban
						2.2.1. d/s, them, sua, xoa			|			2.3.1. truyen van ban den co san
						2.2.2. xem thong tin van ban		|			2.3.2. truyen van ban di co san
						2.2.3. ket xuat						|			2.3.3. tao van ban
						2.2.4. aotucomplete nguoi ky		|			2.3.4. d/s vb da tao, xem, sua, xoa
						2.2.5. tep tin dinh kem				|			2.3.5. xem van ban da tao
																		
		*/			
		// Muc 1:
		case 'listDocCat': include ($MODULE_PATH.$module_name.'B_DocCat_list.php'); exit();
		case 'listDocField': include ($MODULE_PATH.$module_name.'B_DocField_list.php'); exit();
		case 'listDocLevel': include ($MODULE_PATH.$module_name.'B_DocLevel_list.php'); exit();
		case 'listUnit': include ($MODULE_PATH.$module_name.'B_Unit_list.php'); exit();
		case 'autoUnit': include ($MODULE_PATH.$module_name.'autocomplete.php'); exit();
		case 'listImportant': include ($MODULE_PATH.$module_name.'B_Important_list.php'); exit();
		case 'listSecret': include ($MODULE_PATH.$module_name.'B_Secret_list.php'); exit();
		case 'listSignObj': include ($MODULE_PATH.$module_name.'B_SignObj_list.php'); exit();
		case 'listSignPer': include ($MODULE_PATH.$module_name.'B_SignPer_list.php'); exit();
		case 'listInterdisci': include ($MODULE_PATH.$module_name.'B_Interdisci_list.php'); exit();
		case 'listDocday': 		include ($MODULE_PATH.$module_name.'B_Docday_list.php'); exit();
		case 'listHuongdan': 	include ($MODULE_PATH.$module_name.'B_Huongdan_list.php'); exit();
			
		// Muc 2.1:
		case 'listDoc': include ($MODULE_PATH.$module_name.'B_Doc_list.php'); exit();
		case 'tranDoc': include ($MODULE_PATH.$module_name.'B_Doc_tran.php'); exit();
		case 'Phanloai': include ($MODULE_PATH.$module_name.'B_Doc_phanloai.php'); exit();
		case 'listDocReply': include ($MODULE_PATH.$module_name.'B_DocReply_list.php'); exit();
		case 'replyDoc': include ($MODULE_PATH.$module_name.'B_Doc_reply.php'); exit();
		case 'processDoc': include ($MODULE_PATH.$module_name.'B_Doc_process.php'); exit();
		case 'finishDoc': include ($MODULE_PATH.$module_name.'B_Doc_finish.php'); exit();
        case 'finishDocAll': include ($MODULE_PATH.$module_name.'B_Doc_finish_all.php'); exit();
		case 'Giaiquyet': include ($MODULE_PATH.$module_name.'B_Doc_giaiquyet.php'); exit();
		case 'phoihopDoc': include ($MODULE_PATH.$module_name.'B_Doc_phoihop.php'); exit();
		case 'listAddUser': include ($MODULE_PATH.$module_name.'B_AddUser_list.php'); exit();
		case 'viewDoc': include ($MODULE_PATH.$module_name.'B_Doc_view.php'); exit();
		case 'expDocReport': include ($MODULE_PATH.$module_name.'B_DocReport_exp.php'); exit();
        case 'expBCVBDenCham': include ($MODULE_PATH.$module_name.'B_BCVBDen_cham_exp.php'); exit();
		case 'reportDoc': include ($MODULE_PATH.$module_name.'B_Doc_report.php'); exit();
		case 'lateDoc': include ($MODULE_PATH.$module_name.'B_Doc_late.php'); exit();
		case 'expDocLate': include ($MODULE_PATH.$module_name.'B_DocLate_exp.php'); exit();
		case 'listDocFile': include ($MODULE_PATH.$module_name.'B_DocFile_list.php'); exit();
        case 'printPGV': include ($MODULE_PATH.$module_name.'B_PGV_print.php'); exit();
		
		// Muc 2.2:
		case 'listDocOut': include ($MODULE_PATH.$module_name.'B_DocOut_list.php'); exit();
		case 'viewDocOut': include ($MODULE_PATH.$module_name.'B_DocOut_view.php'); exit();
		case 'expDocOutReport': include ($MODULE_PATH.$module_name.'B_DocOutReport_exp.php'); exit();
		case 'B_user_obj': include ('B_user_obj.php'); exit();
		case 'B_docOut_code': include ('B_docOut_code.php'); exit();
		case 'reportDocOut': include ($MODULE_PATH.$module_name.'B_DocOut_report.php'); exit();
		case 'listDocOutFile': include ($MODULE_PATH.$module_name.'B_DocOutFile_list.php'); exit();
        // Muc 2.2-Du thao:
        case 'listDocDT': include ($MODULE_PATH.$module_name.'B_DocDT_list.php'); exit();
        case 'listDocDTFile': include ($MODULE_PATH.$module_name.'B_DocDTFile_list.php'); exit();
        case 'viewDocDT': include ($MODULE_PATH.$module_name.'B_DocDT_view.php'); exit();
        case 'expDocDTReport': include ($MODULE_PATH.$module_name.'B_DocDTReport_exp.php'); exit();
		
		// Muc 2.3:
		// ------- Documents manage
		case 'listDocinQLVB': include ($MODULE_PATH.$module_name.'B_DocinQLVB_list.php'); exit();
		case 'viewDocinQLVB': include ($MODULE_PATH.$module_name.'B_DocinQLVB_view.php'); exit();
		case 'listDocQLVB': include ($MODULE_PATH.$module_name.'B_DocQLVB_list.php'); exit();
		case 'viewDocQLVB': include ($MODULE_PATH.$module_name.'B_DocQLVB_view.php'); exit();
		
		case 'VT_Truyennhan': include ($MODULE_PATH.$module_name.'B_Doc_list.php'); exit();
		case 'ND_Truyennhan': include ($MODULE_PATH.$module_name.'B_DocReceive_list.php'); exit();
		
		case 'viewDocReceive': include ($MODULE_PATH.$module_name.'B_DocReceive_view.php'); exit();
		case 'expDocReport': include ($MODULE_PATH.$module_name.'B_DocReport_exp.php'); exit();
		case 'expDetailReport': include ($MODULE_PATH.$module_name.'B_DocDetail_exp.php'); exit();
		case 'viewDoc': include ($MODULE_PATH.$module_name.'B_Doc_view.php'); exit();
		case 'addDoc': include ($MODULE_PATH.$module_name.'B_Doc_add.php'); exit(); // no edit
		case 'addDocReply': include ($MODULE_PATH.$module_name.'B_DocReply_add.php'); exit();
		case 'listTNVBReply': include ($MODULE_PATH.$module_name.'B_DocReply_list.php'); exit();
		case 'listYkien': include ($MODULE_PATH.$module_name.'B_Ykien_list.php'); exit();
		case 'viewDocReply': include ($MODULE_PATH.$module_name.'B_DocReply_view.php'); exit();
		case 'searchDoc': include ($MODULE_PATH.$module_name.'B_Doc_search.php'); exit();
		case 'reportDoc': include ($MODULE_PATH.$module_name.'B_Doc_report.php'); exit();
		case 'detailReport': include ($MODULE_PATH.$module_name.'B_Docdetail_report.php'); exit();
			
		// ------- Document files manage
		case 'listTNVBFile': include ($MODULE_PATH.$module_name.'B_DocReplyFile_list.php'); exit();
		
		// ------- Document receive manage
		case 'listReceive': include ($MODULE_PATH.$module_name.'B_Receive_list.php'); exit();
		case 'viewReceive': include ($MODULE_PATH.$module_name.'B_Receive_view.php'); exit();
		case 'editReceive': include ($MODULE_PATH.$module_name.'B_Receive_edit.php'); exit();
		case 'addReceive': include ($MODULE_PATH.$module_name.'B_Receive_add.php'); exit();
		case 'addReceiveOut': include ($MODULE_PATH.$module_name.'B_ReceiveOut_add.php'); exit();
		
		/*  -----------------------------------------------------------------------------------------------
			Module: DANH MUC CHUC NANG
			Cac chuc nang khac:
				1. Cong viec
				2. Tin nhan - Tin nhan SMS
				3. Thu tin
				4. Kho du lieu
				5. Chat truc tuyen - khong thong qua index.php
				6. Danh ba
		*/	
		
		// Muc 1:
		case 'listCvCat'		: include ($MODULE_PATH.$module_name.'B_Congviec_list.php'); exit();
		case 'addEditCvCat'		: include ($MODULE_PATH.$module_name.'B_CvCat_add_edit.php'); exit();
		case 'addEditCvSub'		: include ($MODULE_PATH.$module_name.'B_CvSub_add_edit.php'); exit();
		case 'addEditCvIndex'	: include ($MODULE_PATH.$module_name.'B_CvIndex_add_edit.php'); exit();
		case 'addEditCvLog'		: include ($MODULE_PATH.$module_name.'B_CvLog_add_edit.php'); exit();
        case 'addEditCvLogLd'	: include ($MODULE_PATH.$module_name.'B_CvLogLd_add_edit.php'); exit();
		case 'expCongviecReport'	: include ($MODULE_PATH.$module_name.'B_Congviec_report.php'); exit();
        case 'CongviecPrint'	: include ($MODULE_PATH.$module_name.'B_Congviec_print.php'); exit();
        case 'listCVFile'	    : include ($MODULE_PATH.$module_name.'B_CVFile_list.php'); exit();
		
		// Muc 2:
		case 'listMsg'		: include ($MODULE_PATH.$module_name.'B_Msg_list.php'); exit();
		case 'listDrafMsg'	: include ($MODULE_PATH.$module_name.'B_DrafMsg_list.php'); exit();
		case 'listMsgUser'	: include ($MODULE_PATH.$module_name.'B_MsgUser_list.php'); exit();
		case 'listMsgImp'	: include ($MODULE_PATH.$module_name.'B_MsgImp_list.php'); exit();
		case 'listMsgRac'	: include ($MODULE_PATH.$module_name.'B_MsgRac_list.php'); exit();
		case 'MsglistUser'	: include ($MODULE_PATH.$module_name.'listUser.php'); exit();
		case 'viewMsg'		: include ($MODULE_PATH.$module_name.'B_Msg_view.php'); exit();
		case 'addMsg'		: include ($MODULE_PATH.$module_name.'B_Msg_add.php'); exit();
		
		// Muc 4:
		case 'listKDL_Chung': include ($MODULE_PATH.$module_name.'B_Kdl_chung_list.php'); exit();
		case 'listKDL_Pb'	: include ($MODULE_PATH.$module_name.'B_Kdl_pb_list.php'); exit();
		case 'listKDL_Cn'	: include ($MODULE_PATH.$module_name.'B_Kdl_cn_list.php'); exit();
		case 'addEditKDL'	: include ($MODULE_PATH.$module_name.'B_Kdl_add_edit.php'); exit();
		case 'addEditDL'	: include ($MODULE_PATH.$module_name.'B_Dl_add_edit.php'); exit();
		case 'listDlFile'	: include ($MODULE_PATH.$module_name.'B_DlFile_list.php'); exit();
		
		// Muc 6:
		case 'listUserPhone': 	include ($MODULE_PATH.$module_name.'B_UserPhone_list.php'); exit();
															
		/* --------------------------Utilities--------------------------- */
		// ------- Logout
		case 'logout':
			if (isset($_SESSION["user_id"])){
				redirect("logout.php");		
			}
			exit();
		
		/* --------------------------Default page----------------------- */
		// ------ upload
		case 'uploadPic': // View list Image page
			include ("UploadPic.php");
		exit();	
		
		case 'nothingPage': echo 'Đang tải dữ liệu...'; exit();
			
		// ------ default load
		default: 
			// ---- redirect to homepage of this shop 
			include ("admin_index.php");
			exit();
	}
?>