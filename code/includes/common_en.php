<?php 
$int_num_result = 10;	//so ban ghi tren 1 trang
$int_cur_position = 0;	//vi tri hien tai

$title = 'Vietnamese Nurse Association';
$loading = 'Loading. Please wait...';
$access_denied = 'Access denied. Login, please';
$common_order = 'Order by';
$common_view = 'View';
$common_total = 'Total';
$common_perpage = ' / 1 page';

$index_module_doc = 'NEW DOCUMENTS';
$index_module_gallery = 'OUR EVENTS';

$navigator_register = 'Register new member';
$register_username = 'Username';
$register_password = 'Password';
$register_confirm = 'Confirm password';
$register_email = 'Email:';
$register_mobile = 'Mobile:';
$register_job = 'Job:';
$register_address = 'Address:';
$register_captcha = 'Validate Image:';
$register_captcha_link = "<a href='no_matter' onClick=\"document.getElementById('__code__').src = 'includes/imgval/code.php?id=' + ++ts; return false\" style='text-decoration:underline'>Click here</a> for new code";
$register_submit = 'Register';
$register_success = 'Register Successfully';
$register_alert = 'Welcome to Vietnamese Nurse Association. You need login to use our documents.';
$register_content = 'Welcome to Vietnamese Nurse Association.';
$register_subject = 'Register Successfully';


$news_categories_const = 'CATEGORIES';
$navigator_news = 'News';
$navigator_product = 'Doccuments';
$navigator_album = 'Image Gallery';

$news_noresult = 'No result';

$products_noresult = 'No result';

$album_description = 'Description';

$home = 'About';
$Newst = 'News';
$kh = 'Customer';
$dly = 'Agents';
$LH = 'Contact';

$welcome = 'Welcome';
$subheader_logout = 'logout';
$subheader_account = 'Account';
$subheader_password = 'Password';
$subheader_changepass = 'Change password';
$subheader_cart = 'Cart';
$subheader_resetpass = 'Reset password';
$subheader_remember = 'Remember';
$subheader_mem = 'Total member: ';
$subheader_update = 'Update role';
$subheader_dob = '<b>Foundation date:</b> 26/10/1990';
$subheader_support = 'Support online: <a href="ymsgr:sendim?thovna">thovna</a>';

$footer_home = 'Home';
$footer_news = 'News';
$footer_product = 'Documents';
$footer_faq = 'FAQs';
$footer_contact = 'Contact';
$footer_copyright = 'Copyright &copy; Vietnamese Nurse Association';

$navigator_home = 'Home page'; 

$memberarea = 'MEMBER';

$cart_ptitle = 'Title';
$cart_pprice = 'Price(VND)';
$cart_pnumber = 'Number';
$cart_ptotal = 'Total';
$cart_action = 'Remove';
$cart_empty = 'Your cart is empty';

$bill_form = 'Bill Information';
$bill_detail = 'Bill Detail';
$bill_cart = 'Payment';
$bill_ship = 'Shipping';
$bill_register = 'Order';
$bill_complete = 'Your request is sent to Administrator. We will contact to you as soon as prosible. Thanks a lot';

$key = array_keys($_GET);
//print_r($key);home
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

$assign_list["news_categories_const"] = $news_categories_const;
$assign_list["navigator_news"] = $navigator_news;
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