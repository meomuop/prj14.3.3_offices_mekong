<?php 
$int_num_result = 10;	//so ban ghi tren 1 trang
$int_cur_position = 0;	//vi tri hien tai

$title = 'Công ty TNHH dệt len XNK Hiền';
$loading = 'Đang tải dữ liệu. Xin chờ trong giây lát...';
$access_denied = 'Bạn không được phép truy cập trang này. Yêu cầu đăng nhập';
$common_order = 'Sắp xếp theo';
$common_view = 'Hiển thị';
$common_total = 'Có tất cả';
$common_perpage = ' / 1 trang';

$index_module_doc = 'TÀI LIỆU MỚI';
$index_module_gallery = 'NHẬT KÝ HOẠT ĐỘNG CỦA HỘI';

$navigator_register = 'Đăng ký thành viên';
$register_username = 'Tài khoản';
$register_password = 'Mật khẩu';
$register_confirm = 'Xác nhận mật khẩu';
$register_email = 'Email:';
$register_mobile = 'Điện thoại:';
$register_job = 'Công việc:';
$register_address = 'Địa chỉ:';
$register_captcha = 'Mã xác nhận:';
$register_captcha_link = "Nếu khó nhìn bạn có thể <a href='no_matter' onClick=\"document.getElementById('__code__').src = 'includes/imgval/code.php?id=' + ++ts; return false\" style='text-decoration:underline'>Nhấn vào đây</a> để thay mã khác";
$register_submit = 'Đăng ký';
$register_success = 'Đăng ký thành công';
//$register_alert = 'Chào mừng bạn tham gia hội điều dưỡng Việt Nam. Bạn có thể đăng nhập để tham khảo, sử dụng các tài liệu của hội.';
$register_content = 'Chào mừng bạn tham gia hội điều dưỡng Việt Nam.';
$register_subject = 'Dang ky thanh cong';

$news_categories_const = 'DANH MỤC';
$navigator_About = 'Bài viết';
$navigator_news = 'Tin tức';
$navigator_cs = 'Khách hàng';
$navigator_product = 'Sản phẩm';
$navigator_album = 'Thư viện ảnh';

$news_noresult = 'Không có tin tức';

$products_noresult = 'Không có sản phẩm';

$album_description = 'Mô tả';

$welcome = 'Xin chào';
$subheader_logout = 'thoát';
$subheader_account = 'Tài khoản';
$subheader_password = 'Mật khẩu';
$subheader_changepass = 'Thay đổi mật khẩu';
$subheader_cart = 'Giỏ hàng';
$subheader_resetpass = 'Khôi phục mật khẩu';
$subheader_remember = 'Nhớ mật khẩu';
$subheader_mem = 'Tổng số thành viên: ';
$subheader_update = 'Nâng cấp thành viên';
$subheader_dob = '<b>Ngày thành lập:</b> 26/10/1990';
$subheader_support = 'Hỗ trợ trực tuyến: <a href="ymsgr:sendim?thovna">thovna</a>';

$footer_home = 'Trang chủ';
$footer_news = 'Tin tức';
$footer_product = 'Tài liệu';
$footer_faq = 'FAQs';
$footer_contact = 'Liên hệ';
$footer_copyright = 'Bản quyền thuộc về Hội Điều Dưỡng Việt Nam';

$navigator_home = 'Trang chủ';

$memberarea = 'THÀNH VIÊN';

$cart_ptitle = 'Tiêu đề';
$cart_pprice = 'Giá(VND)';
$cart_pnumber = 'Số lượng';
$cart_ptotal = 'Thành tiền';
$cart_action = 'Xóa';
$cart_empty = 'Giỏ hàng rỗng';

$home = 'Giới thiệu';
$Newst = 'Tin tức';
$kh = 'Khách hàng';
$dly = 'Đại lý';
$LH = 'Liên hệ';

$bill_form = 'Thông tin hóa đơn';
$bill_detail = 'Chi tiết đơn hàng';
$bill_cart = 'Phương thức thanh toán';
$bill_ship = 'Địa chỉ nhận tài liệu';
$bill_register = 'Đặt mua';
$bill_complete = 'Cám ơn bạn đã mua hàng !.';

global $key;
$key = array_keys($_GET);
//print_r($key);
$assign_list["home"] = $home;
$assign_list["Newst"] = $Newst;
$assign_list["kh"] = $kh;
$assign_list["dly"] = $dly;
$assign_list["LH"] = $LH;
$assign_list["title"] = $title;
$assign_list["loading"] = $loading;
$assign_list["access_denied"] = $access_denied;
$assign_list["common_order"] = $common_order;
$assign_list["common_view"] = $common_view;
$assign_list["common_total"] = $common_total;
$assign_list["common_perpage"] = $common_perpage;

$assign_list["index_module_doc"] = $index_module_doc;
$assign_list["index_module_gallery"] = $index_module_gallery;

$assign_list["register_username"] = $register_username;
$assign_list["register_password"] = $register_password;
$assign_list["register_confirm"] = $register_confirm;
$assign_list["register_email"] = $register_email;
$assign_list["register_mobile"] = $register_mobile;
$assign_list["register_job"] = $register_job;
$assign_list["register_address"] = $register_address;
$assign_list["register_captcha"] = $register_captcha;
$assign_list["register_captcha_link"] = $register_captcha_link;
$assign_list["register_submit"] = $register_submit;
$assign_list["subheader_register"] = $navigator_register;
$assign_list["register_success"] = $register_success;
$assign_list["register_alert"] = $register_alert;
$assign_list["navigator_cs"] = $navigator_cs;
$assign_list["news_categories_const"] = $news_categories_const;
$assign_list["navigator_news"] = $navigator_news;
$assign_list["navigator_About"] = $navigator_About;
$assign_list["navigator_product"] = $navigator_product;
$assign_list["navigator_album"] = $navigator_album;

$assign_list["news_noresult"] = $news_noresult;

$assign_list["products_noresult"] = $products_noresult;

$assign_list["album_description"] = $album_description;

$assign_list["welcome"] = $welcome;
$assign_list["subheader_logout"] = $subheader_logout;
$assign_list["subheader_account"] = $subheader_account;
$assign_list["subheader_password"] = $subheader_password;
$assign_list["subheader_changepass"] = $subheader_changepass;
$assign_list["subheader_cart"] = $subheader_cart;
$assign_list["subheader_resetpass"] = $subheader_resetpass;
$assign_list["subheader_remember"] = $subheader_remember;
$assign_list["subheader_mem"] = $subheader_mem;
$assign_list["subheader_update"] = $subheader_update;
$assign_list["subheader_dob"] = $subheader_dob;
$assign_list["subheader_support"] = $subheader_support;

$assign_list["footer_home"] = $footer_home;
$assign_list["footer_news"] = $footer_news;
$assign_list["footer_product"] = $footer_product;
$assign_list["footer_faq"] = $footer_faq;
$assign_list["footer_contact"] = $footer_contact;
$assign_list["footer_copyright"] = $footer_copyright;

$assign_list["memberarea"] = $memberarea;

$assign_list["cart_ptitle"] = $cart_ptitle;
$assign_list["cart_pprice"] = $cart_pprice;
$assign_list["cart_pnumber"] = $cart_pnumber;
$assign_list["cart_ptotal"] = $cart_ptotal;
$assign_list["cart_action"] = $cart_action;
$assign_list["cart_empty"] = $cart_empty;

$assign_list["bill_form"] = $bill_form;
$assign_list["bill_detail"] = $bill_detail;
$assign_list["bill_cart"] = $bill_cart;
$assign_list["bill_ship"] = $bill_ship;
$assign_list["bill_register"] = $bill_register;
$assign_list["bill_complete"] = $bill_complete;
