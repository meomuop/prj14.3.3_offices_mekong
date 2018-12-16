<?php
class php_sms {
	function send_sms($phone_num, $sms_text, $com_port){
		//echo $phone_num.'-'.$sms_text.'-'.$com_port.'<br>';
		/**
		 * Sends data to the modem
		 */
		if (!function_exists('send_data')):
			function send_data($f, $string) {
				//echo "< $string\n";
				fprintf($f, "$string\r\n");
			}
		endif;
		
		/**
		 * Reads lines from the serial port.  It reads until a non blank line is
		 * received then returns it.
		 */
		if (!function_exists('get_string')):
		function get_string($f) {
			do {
					// remove carriage returns, line feeds and excess white space
					$response = trim(str_replace(array("\r\n","\r","\n"), '', fgets($f)));
			} while ($response == '');
		
			return $response;
		}
		endif;
		
		/**
		 * Waits for OK to be sent back by the modem.
		 */
		if (!function_exists('wait_for_ok')):
		function wait_for_ok($f) {
			do {
					$response = get_string($f);
					//echo "> $response\n";
			} while ($response != "OK");
		}
		endif;
			 
		if($phone_num && $sms_text && $com_port):
			//define('PHONE_NUMBER', $phone_num);
			//define('SMS_TEXT', $sms_text);
			//define('COM_PORT', $com_port);	 
			// MAIN CODE
			 
			// Create the context
			$c = stream_context_create(array('dio' => 
													array('data_rate' => 9600, //--> de mac dinh
														  'data_bits' => 8, //--> so bit gui di 1 lan
														  'stop_bits' => 1, 
														  'parity' => 0, 
														  'flow_control' => 0,
														  'is_blocking' => 0,
														  'canonical' => 1)
											)
										);
				 
			// Mở cổng USB 3G (mở USB 3G xem thông tin về USB 3 G sẽ có thông tin về cổng của USB), khi chạy sẽ phải tắt USB 3G (USB vẫn cắm trên máy).
			// Trong trường hợp này là cổng com5 
			$f = fopen($com_port, 'r+', false, $c);
			
			if(!$f){
				echo 'Port is not open or being used by another program.';
				} 
			if ($f) {
				// Re-enable blocking
				stream_set_blocking($f, true);
			
				// Set SMS text entry mode
				send_data($f, "AT+CMGF=1");
				wait_for_ok($f);
			
				// Send an SMS
				send_data($f, "AT+CMGS=\"" . $phone_num . "\"");
				send_data($f, $sms_text);
				// Send CTRL-Z to end SMS text entry
				fprintf($f, chr(26));   
				wait_for_ok($f);
			
				// Close the port
				fclose($f);
			}
		endif;
	}
}
?>