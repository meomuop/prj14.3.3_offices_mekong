<?php
/*
 * Created on Mar 28, 2007
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
*/
	require_once("../includes/login_requires.php");
	
	$db_prefix = "db14_0_tha_offices_";
	if($_GET['khoiphuc']==1):
		//-------------------------------------------------------------------------
		
		/* --------------- Tao thu muc chua file moi theo nam----------------------*/
		// Desired folder structure
		$doc_struc = '../doc_uploads_'.(date('Y')+1).'/';
		$kdl_sturc = '../kdl_uploads_'.(date('Y')+1).'/';
		$tnvb_struc = '../tnvb_uploads_'.(date('Y')+1).'/';
		
		if (is_dir($doc_struc)) {
			$msg_doc = '<font color="#999900">Thư mục <b>'.$doc_struc.'</b> đã tồn tại</font>';
			$rs_doc = 1;
		}elseif(!mkdir($doc_struc, 0777, true)){
			$msg_doc = '<font color="#FF0000">Không thể tạo được thư mục: <b>'.$doc_struc.'</b></font>';
			$rs_doc = 2;
			$msg_doc_end_fol = '<font color="#FF0000">Việc này dẫn tới hệ thống trong tương lai sẽ không thể upload được tệp tin đính kèm</font>';
		}else{
			$msg_doc = '<font color="#0000FF">Đã tạo thành công thư mục: <b>'.$doc_struc.'</b></font>';
			$rs_doc = 1;
		}
		
		if (is_dir($kdl_sturc)) {
			$msg_kdl = '<font color="#999900">Thư mục <b>'.$kdl_sturc.'</b> đã tồn tại</font>';
			$rs_kdl = 1;
		}elseif(!mkdir($kdl_sturc, 0777, true)){
			$msg_kdl = '<font color="#FF0000">Không thể tạo được thư mục: <b>'.$kdl_sturc.'</b></font>';
			$rs_kdl = 2;
			$msg_kdl_end_fol = '<font color="#FF0000">Việc này dẫn tới hệ thống trong tương lai sẽ không thể upload được tệp tin đính kèm</font>';
		}else{
			$msg_kdl = '<font color="#0000FF">Đã tạo thành công thư mục: <b>'.$kdl_sturc.'</b></font>';
			$rs_kdl = 1;
		}
		
		if (is_dir($tnvb_struc)) {
			$msg_tnvb = '<font color="#999900">Thư mục <b>'.$tnvb_struc.'</b> đã tồn tại</font>';
			$rs_tnvb = 1;
		}elseif(!mkdir($tnvb_struc, 0777, true)){
			$msg_tnvb = '<font color="#FF0000">Không thể tạo được thư mục: <b>'.$tnvb_struc.'</b></font>';
			$rs_tnvb = 2;
			$msg_tnvb_end_fol = '<font color="#FF0000">Việc này dẫn tới hệ thống trong tương lai sẽ không thể upload được tệp tin đính kèm</font>';
		}else{
			$msg_tnvb = '<font color="#0000FF">Đã tạo thành công thư mục: <b>'.$tnvb_struc.'</b></font>';
			$rs_tnvb = 1;
		}
		/*-------------------------------------------------------------------------*/
		
		/*--------------- Tao database moi theo nam-------------------------------*/
		$con = mysql_connect("localhost","root","");
		if (!$con){
			$msg1 = '<font color="#FF0000">Không thể kết nối tới cơ sở dữ liệu: ('.mysql_error().')</font>';
			$msg_end = '<font color="#FF0000">Quá trình thiết lập lại cơ sở dữ liệu buộc phải dừng lại</font>';
			$rs_02 = 2;
		}else{
			if (mysql_query("CREATE DATABASE `".$db_prefix.(date('Y')+1)."` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci",$con)){
				$msg1 = '<font color="#0000FF">Đã tạo thành công cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				
				// ket noi va lay cac bang trong co so du lieu nam hien tai
				mysql_query("use ".$db_prefix.date('Y'),$con);
				
				$tables = mysql_query("SHOW FULL TABLES WHERE Table_Type = 'BASE TABLE'") or die(mysql_error());
				while ($row = mysql_fetch_assoc($tables)) {
					//echo $row['Tables_in_'.$db_prefix.date("Y")];
					//foreach($row as $value) {
					$aTables[] = $row['Tables_in_'.$db_prefix.date("Y")];
					//}
				}
				$i = 0;
				
				foreach ($aTables as $table) {
					$desc = mysql_query("describe " . $table);
					while ($row = mysql_fetch_assoc($desc)) {
						//echo $row["Table_Type"];
						if($row["Table_Type"] == 'BASE TABLE'):
							$aFields[$i][] = array($row["Field"],$row["Type"],$row["Null"],$row["Key"],$row["Default"],$row["Extra"]);
						endif;
					}
					$i++;
				}
				
				// ket noi va copy co so du lieu cho nam tiep theo
				mysql_query("use ".$db_prefix.(date('Y')+1),$con);
				
				for ($i = 0; $i < count($aTables); $i++) {
					// Loop through tables, fields, and rows for create table/insert statements
					$query = "CREATE TABLE ".$db_prefix.(date('Y')+1).".`".$aTables[$i]."` LIKE ".$db_prefix.date('Y').".`".$aTables[$i]."`";
					$query2 = "INSERT INTO ".$db_prefix.(date('Y')+1).".".$aTables[$i]." SELECT * FROM ".$db_prefix.date('Y').".".$aTables[$i];
					if(mysql_query($query) && mysql_query($query2)){$complete_one = 1;} else{$complete_one = 2; exit;}
				}
				
				// tao constrains cho co so du lieu
				$sql_constrains = array(
						'
							ALTER TABLE `tbl_addusers` ADD CONSTRAINT `FK_tbl_addusers` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','		
							ALTER TABLE `tbl_cv_indexs` ADD CONSTRAINT `FK_tbl_cv_indexs` FOREIGN KEY (`cv_sub_id`) REFERENCES `tbl_cv_subs` (`cv_sub_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','				
							ALTER TABLE `tbl_cv_logs` ADD CONSTRAINT `FK_tbl_cv_logs` FOREIGN KEY (`cv_index_id`) REFERENCES `tbl_cv_indexs` (`cv_index_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_cv_subs` ADD CONSTRAINT `FK_tbl_cv_subs` FOREIGN KEY (`cv_cat_id`) REFERENCES `tbl_cv_cats` (`cv_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_dls` ADD CONSTRAINT `FK_tbl_dls` FOREIGN KEY (`kdl_id`) REFERENCES `tbl_dlkhos` (`kdl_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_docfiles` ADD CONSTRAINT `FK_tbl_docfiles` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_docoutfiles` ADD CONSTRAINT `FK_tbl_docoutfiles` FOREIGN KEY (`docOut_id`) REFERENCES `tbl_docouts` (`docOut_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_docreplys` ADD CONSTRAINT `FK_tbl_docreplys_docs` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_feedbacks` ADD CONSTRAINT `FK_tbl_feedbacks` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','						
							ALTER TABLE `tbl_msgusers` ADD CONSTRAINT `FK_tbl_msgusers` FOREIGN KEY (`msg_id`) REFERENCES `tbl_msgs` (`msg_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','						
							ALTER TABLE `tbl_receives` ADD CONSTRAINT `FK_tbl_receives` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','					
							ALTER TABLE `tbl_recusers` ADD CONSTRAINT `FK_tbl_recusers` FOREIGN KEY (`receive_id`) REFERENCES `tbl_receives` (`receive_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vbfiles` ADD CONSTRAINT `FK_tbl_vbfiles` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vbreplyfiles` ADD CONSTRAINT `FK_tbl_vbreplyfiles` FOREIGN KEY (`docreply_id`) REFERENCES `tbl_vbreplys` (`docreply_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vbreplys` ADD CONSTRAINT `FK_tbl_docreplys` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vttbs` ADD CONSTRAINT `FK_tbl_vttbs` FOREIGN KEY (`vttb_sub_id`) REFERENCES `tbl_vttb_subs` (`vttb_sub_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vttb_datlichs` ADD CONSTRAINT `FK_tbl_vttb_datlichs` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vttb_repares` ADD CONSTRAINT `FK_tbl_vttb_repares` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vttb_replaces` ADD CONSTRAINT `FK_tbl_vttb_replaces` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						','	
							ALTER TABLE `tbl_vttb_subs` ADD CONSTRAINT `FK_tbl_vttb_subs` FOREIGN KEY (`vttb_cat_id`) REFERENCES `tbl_vttb_cats` (`vttb_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
						'
				);
				
				mysql_query("use ".$db_prefix.(date('Y')+1),$con);
				for($i=0;$i<count($sql_constrains);$i++):
					if(mysql_query($sql_constrains[$i]))$rs_constrains=1; else $rs_constrains=2;
				endfor;
				
				// tao views cho co so du lieu moi
				$sql_view_1 = "
					CREATE VIEW `".$db_prefix.(date('Y')+1)."`.`doc_docreplys` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`coordinate_depart` AS `coordinate_depart`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`".$db_prefix.(date('Y')+1)."`.`tbl_docs` `D` join `".$db_prefix.(date('Y')+1)."`.`tbl_docreplys` `DR` on((`d`.`doc_id` = `dr`.`doc_id`))));
				";	
				$sql_view_2 = "
					CREATE VIEW `".$db_prefix.(date('Y')+1)."`.`doc_latereport` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`".$db_prefix.(date('Y')+1)."`.`tbl_docs` `D` join `".$db_prefix.(date('Y')+1)."`.`tbl_docreplys` `DR` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`main_department` <> 0)))) group by `d`.`doc_id`);
				";	
				$sql_view_3 = "	
					CREATE VIEW `".$db_prefix.(date('Y')+1)."`.`doc_late_cv` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`".$db_prefix.(date('Y')+1)."`.`tbl_docs` `D` join `".$db_prefix.(date('Y')+1)."`.`tbl_docreplys` `DR` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`process_per` <> 0)))) group by `d`.`doc_id`);
				";	
				$sql_view_4 = "	
					CREATE VIEW `".$db_prefix.(date('Y')+1)."`.`doc_receive` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`doc_unit` AS `doc_unit`,`d`.`department_id` AS `department_id`,`d`.`doc_code` AS `doc_code`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_direct` AS `doc_direct`,`d`.`doc_note` AS `doc_note`,`d`.`doc_signed` AS `doc_signed`,`d`.`signPer_id` AS `signPer_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`r`.`receive_id` AS `receive_id`,`r`.`doc_id` AS `R_doc_id`,`r`.`department_id` AS `R_department_id`,`r`.`receive_per` AS `receive_per`,`r`.`receive_note` AS `receive_note`,`r`.`receive_time` AS `receive_time`,`r`.`read_status` AS `read_status`,`r`.`read_time` AS `read_time`,`r`.`read_per` AS `read_per` from (`".$db_prefix.(date('Y')+1)."`.`tbl_vbs` `D` join `".$db_prefix.(date('Y')+1)."`.`tbl_receives` `R` on((`d`.`doc_id` = `r`.`doc_id`))));
				";	
				$sql_view_5 = "	
					CREATE VIEW `".$db_prefix.(date('Y')+1)."`.`doc_reports` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`".$db_prefix.(date('Y')+1)."`.`tbl_docs` `D` join `".$db_prefix.(date('Y')+1)."`.`tbl_docreplys` `DR` on((`d`.`doc_id` = `dr`.`doc_id`))) group by `d`.`doc_id`;
				";	
				$sql_view_6 = "	
					CREATE VIEW `".$db_prefix.(date('Y')+1)."`.`doc_users` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`u`.`user_fullname` AS `user_fullname`,`u`.`object_id` AS `object_id` from (`".$db_prefix.(date('Y')+1)."`.`tbl_docs` `D` join `".$db_prefix.(date('Y')+1)."`.`tbl_users` `U` on((`d`.`user_id` = `u`.`user_id`)));
				";
				
				mysql_query("use ".$db_prefix.(date('Y')+1),$con);
				if(mysql_query($sql_view_1))$rs_view=1; else $rs_view=2;
				if(mysql_query($sql_view_2))$rs_view=1; else $rs_view=2;
				if(mysql_query($sql_view_3))$rs_view=1; else $rs_view=2;
				if(mysql_query($sql_view_4))$rs_view=1; else $rs_view=2;
				if(mysql_query($sql_view_5))$rs_view=1; else $rs_view=2;
				if(mysql_query($sql_view_6))$rs_view=1; else $rs_view=2;
				
				// xoa du lieu cu
				mysql_query("use ".$db_prefix.(date('Y')+1),$con);
				if(mysql_query("TRUNCATE TABLE `tbl_docs`"))			$rs_truncate=1; else $rs_truncate=2;
				if(mysql_query("TRUNCATE TABLE `tbl_docouts`"))			$rs_truncate=1; else $rs_truncate=2;
				if(mysql_query("TRUNCATE TABLE `tbl_vbs`"))				$rs_truncate=1; else $rs_truncate=2;
				if(mysql_query("TRUNCATE TABLE `ajax_chat_messages`"))	$rs_truncate=1; else $rs_truncate=2;
				if(mysql_query("TRUNCATE TABLE `tbl_plan_details`"))	$rs_truncate=1; else $rs_truncate=2;
				if(mysql_query("TRUNCATE TABLE `tbl_msgs`"))			$rs_truncate=1; else $rs_truncate=2;
								
				// show ket qua
				if($complete_one==1):
					$msg2 = '<font color="#0000FF">Đã nạp thành công dữ liệu cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
					$rs_02 = 1;
				else:
					$msg2 = '<font color="#FF0000">Đã thất bại trong việc nạp dữ liệu cho tạo cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
					if(mysql_query("DROP DATABASE ".$db_prefix.(date('Y')+1),$con)):
					$msg2 .= '(Cơ sở dữ liệu db14_0_tha_offices_'.(date('Y')+1).' đã được xóa)';
					$msg_end = '<font color="#FF0000">Quá trình thiết lập lại cơ sở dữ liệu buộc phải dừng lại</font>';
					$rs_02 = 2;
					else: 
					$msg2 .= '(Cơ sở dữ liệu db14_0_tha_offices_'.(date('Y')+1).' chưa được xóa thành công, hãy liên lạc với kỹ thuật để được trợ giúp)';
					$msg_end = '<font color="#FF0000">Quá trình thiết lập lại cơ sở dữ liệu buộc phải dừng lại</font>';
					$rs_02 = 2;
					endif;
				endif;
				
				if($rs_constrains==1):
					$msg_constrains = '<font color="#0000FF">Đã thành công trong việc tạo khóa ngoại cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				else:
					$msg_constrains = '<font color="#FF0000">Đã thất bại trong việc tạo khóa ngoại cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				endif;
				
				if($rs_view==1):
					$msg_view = '<font color="#0000FF">Đã tạo Views thành công cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				else:
					$msg_view = '<font color="#FF0000">Đã thất bại trong việc tạo Views cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				endif;
				
				if($rs_truncate==1):
					$msg_truncate = '<font color="#0000FF">Đã thành công trong việc đưa các chức năng nghiệp vụ về trạng thái ban đầu cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				else:
					$msg_truncate = '<font color="#FF0000">Đã thất bại trong việc đưa các chức năng nghiệp vụ về trạng thái ban đầu cho cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b></font>';
				endif;
				
			}else{
				$msg1 = '<font color="#FF0000">Không thể tạo cơ sở dữ liệu: <b>db14_0_tha_offices_'.(date('Y')+1).'</b><br>('.mysql_error().')</font>';
				$msg_end = '<font color="#FF0000">Quá trình thiết lập lại cơ sở dữ liệu buộc phải dừng lại</font>';
				$rs_02 = 2;
			}
		}
		
		mysql_close($con);
		/*-------------------------------------------------------------------------*/
	endif;
	
	$assign_list["error"] 	  = $error;
	$assign_list["msg_doc"]   = $msg_doc;
	$assign_list["msg_kdl"]   = $msg_kdl;
	$assign_list["msg_tnvb"]  = $msg_tnvb;
	$assign_list["msg_doc_end_fol"]   = $msg_doc_end_fol;
	$assign_list["msg_kdl_end_fol"]   = $msg_kdl_end_fol;
	$assign_list["msg_tnvb_end_fol"]  = $msg_tnvb_end_fol;
	$assign_list["rs_doc"]   	= $rs_doc;
	$assign_list["rs_kdl"]   	= $rs_kdl;
	$assign_list["rs_tnvb"]   	= $rs_tnvb;
	
	$assign_list["msg1"]   	= $msg1;
	$assign_list["msg2"]   	= $msg2;
	$assign_list["msg3"]   	= $msg3;
	
	$assign_list["rs_constrains"] = $rs_constrains;
	$assign_list["msg_constrains"]= $msg_constrains;
	$assign_list["rs_view"]   	= $rs_view;
	$assign_list["msg_view"] 	= $msg_view;
	$assign_list["rs_truncate"] = $rs_truncate;
	$assign_list["msg_truncate"]= $msg_truncate;
	
	$assign_list["msg_end"]   	= $msg_end;
	$assign_list["rs_02"]   	= $rs_02;
	$assign_list["khoiphuc"]   	= $_GET['khoiphuc'];
	$assign_list['http_root'] 	= $http_root;
	
	$assign_list["vars"]  	= $vars;
	$smarty->assign($assign_list);
	$smarty->display("sysreset.tpl"); 
	
