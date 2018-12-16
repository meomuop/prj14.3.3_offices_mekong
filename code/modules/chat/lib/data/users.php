<?php
/*
 * @package AJAX_Chat
 * @author Sebastian Tschan
 * @copyright (c) Sebastian Tschan
 * @license GNU Affero General Public License
 * @link https://blueimp.net/ajax/
 */

// List containing the registered chat users:
$users = array();

// Default guest user (don't delete this one):
$conn = mysql_connect('localhost', 'root', '') or die ('Error connecting to mysql');
if(isset($_POST['db_year'])) $_SESSION['db_year'] = $_POST['db_year'];
elseif(!isset($_POST['db_year']) && !isset($_SESSION['db_year'])) $_SESSION['db_year'] = date('Y');
mysql_select_db('db14_0_tha_offices_'.$_SESSION['db_year']);
mysql_query("SET NAMES 'utf-8'");

$sql = "select * from tbl_users where user_active = 1";
$result = mysql_query($sql) or die($sql);
if($result):
	$i = 0;
	while($row_user = mysql_fetch_array($result)):
		if($row_user['user_level'] == 1){
			$users[$i] = array();
			$users[$i]['userRole'] = AJAX_CHAT_ADMIN;
			$users[$i]['userName'] = $row_user['user_name'];
			$users[$i]['password'] = $row_user['user_encode_pass'];
			$users[$i]['channels'] = array(0,1);
		}else{
			$users[$i] = array();
			$users[$i]['userRole'] = AJAX_CHAT_GUEST;
			$users[$i]['userName'] = $row_user['user_name'];
			$users[$i]['password'] = $row_user['user_encode_pass'];
			$users[$i]['channels'] = array(0);
		}
		$i++;
	endwhile;
endif;
/*
$users[0] = array();
$users[0]['userRole'] = AJAX_CHAT_GUEST;
$users[0]['userName'] = null;
$users[0]['password'] = null;
$users[0]['channels'] = array(0);

// Sample admin user:
$users[1] = array();
$users[1]['userRole'] = AJAX_CHAT_ADMIN;
$users[1]['userName'] = 'admin';
$users[1]['password'] = 'admin';
$users[1]['channels'] = array(0,1);

// Sample moderator user:
$users[2] = array();
$users[2]['userRole'] = AJAX_CHAT_MODERATOR;
$users[2]['userName'] = 'moderator';
$users[2]['password'] = 'moderator';
$users[2]['channels'] = array(0,1);

// Sample registered user:
$users[3] = array();
$users[3]['userRole'] = AJAX_CHAT_USER;
$users[3]['userName'] = 'user';
$users[3]['password'] = 'user';
$users[3]['channels'] = array(0,1);
*/
?>