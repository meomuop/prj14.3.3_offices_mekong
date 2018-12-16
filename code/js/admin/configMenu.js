//<META http-equiv=Content-Type content="text/html; charset=utf-8">
// JavaScript Document
/*
- Quan ly cap cao
	- Danh sach quan tri
	- Danh sach lien he
	- Danh sach thanh vien
- Quan ly he thong
	- Cau hinh website
	- Thong ke he thong
- Quan ly trang chu
	- Loai danh muc
	- Danh muc
	- Dich vu
	- Tin tuc
	- Doi ngu chung toi
	- Danh muc du an
	- Thu vien anh
	- Thong bao
	- Sieu thi truc tuyen
	- Blog informa
- Quan ly chuc nang
	- Danh sach quang cao
	- Lien ket tuy chon
- Tien ich
	- Trang chu
	- Thoat quyen
*/
var myMenu =
			[
			 	//----------------------Quan ly cap cao-------------------------
				[null,'Quản lý cấp cao',null,null,'Quản lý cấp cao',					
					['<img src="../images/admin/user-icon.gif" width=20/>','Danh sách quản trị','?listUser&mod=users',null,'Danh sách quản trị'],
					_cmSplit,
					['<img src="../images/admin/contact_icon.gif" width=20/>','Danh sách liên hệ','?listContact&mod=contacts',null,'Danh sách liên hệ'],
					_cmSplit,
					
					['<img src="../images/admin/user.png" width=20/>','Danh sách thành viên','?listMembers&mod=members',null,'Danh sách thành viên'],
				],
				
				_cmSplit,
				_cmSplit,
				_cmSplit,
				_cmSplit,
				
				//----------------------Quan ly he thong-------------------------
				[null,'Quản lý hệ thống',null,null,'Quản lý hệ thống',					
					['<img src="../images/admin/config.png" width=20/>','Cấu hình website','?editConfig&mod=config',null,'Cấu hình website'],
					_cmSplit,
					['<img src="../images/admin/report_icon.gif" width=20/>','Thống kê hệ thống','?sysStat&mod=sysStat',null,'Thống kê hệ thống'],
				],
				
				_cmSplit,
				_cmSplit,
				_cmSplit,
				_cmSplit,
								
				//----------------------Quan ly Trang chu-------------------------
			  	[null,'Quản lý trang chủ',null,null,'Quản lý trang chủ',
					['<img src="../images/admin/cate-icon.gif" width=20/>','Danh muc','?listCat&mod=categories',null,'Danh muc'],
					_cmSplit,
					['<img src="../images/admin/file_f2.png" width=20/>','Dịch vụ','?listSer&mod=services',null,'Dịch vụ'],
					_cmSplit,
					['<img src="../images/admin/doc_icon.gif" width=20/>','Tin tức','?listNews&mod=news&cattype_id=2',null,'Tin tức'],
					_cmSplit,
					
					['<img src="../images/admin/arrow-icon.png" width=20/>','Đội ngũ chung tôi','?listNewstype&mod=newstypes',null,'Đội ngũ chung tôi'],
					_cmSplit,
					['<img src="../images/admin/arrow-icon.png" width=20/>','Danh mục dự án','?listNewslocate&mod=newslocates',null,'Danh mục dự án'],
					_cmSplit,
					['<img src="../images/admin/doc_icon.gif" width=20/>','Thư viện ảnh','?listNews&mod=news&cattype_id=3',null,'Thư viện ảnh'],
					_cmSplit,
					['<img src="../images/admin/doc_icon.gif" width=20/>','Thông báo','?listNews&mod=news&cattype_id=3',null,'Thông báo'],
					_cmSplit,
					['<img src="../images/admin/doc_icon.gif" width=20/>','Siêu thị trực tuyến','?listNews&mod=news&cattype_id=3',null,'Siêu thị trực tuyến'],
					_cmSplit,
					['<img src="../images/admin/doc_icon.gif" width=20/>','Blog Informa','?listNews&mod=news&cattype_id=3',null,'Blog Informa'],
				],
				
				_cmSplit,
				_cmSplit,
				_cmSplit,
				_cmSplit,
				
				//----------------------Quan ly chuc nang-------------------------
			  	[null,'Quản lý chức năng',null,null,'Quản lý chức năng',
					['<img src="../images/admin/image-icon.gif" width=20/>','Đối tác - quảng cáo','?listAdvs&mod=advs',null,'Đối tác - quảng cáo'],
					_cmSplit,
					['<img src="../images/admin/link-icon.gif" width=20/>','Công cụ tạo block','?listBlock&mod=blocks',null,'Công cụ tạo block'],
				],
				
				_cmSplit,
				_cmSplit,
				_cmSplit,
				_cmSplit,
				
				//----------------------Tien ich-------------------------
			  	[null,'Tiện ích',null,null,'Tiện ích',
			 		['<img src="../images/admin/home-icon.gif" width=20/>','Trang chủ','../?',null,'Trang chủ'],
					_cmSplit,
					['<img src="../images/admin/close-icon.gif" width=20/>','Thoát quyền','?logout',null,'Thoát quyền'],
				],
		  
			];

