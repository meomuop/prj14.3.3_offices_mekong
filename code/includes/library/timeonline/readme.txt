       ___________________________________________________________

                   Time Online - Version 0.9 README
                               June 2004
       ___________________________________________________________

                Copyright (C) 2004 Dragos Protung

_______________________

CONTENTS
_______________________

1. Description
2. System Requirements
3. How to use
4. Contact

_______________________

1. Product Description
_______________________

A PHP class to help get info how much time users spend on a page or on the entire site in a session or the total time.
It can display the time and count it in real time so you can see the seconds, minutes, etc. changeing

This is not a finished script. I only tested it on IE 6 Mozilla 1.4 and Opera 7.1
For other Browsers use: 
      $test = new time_online;
      $test -> userTO; // array with the time for te current session
      $test -> userTT; // array with the entyre time (from every visit)
and display the times yourself


_______________________

2. System Requirements
_______________________

- for running the script: PHP
- User must have :
     - cookies enabled
     - IE 6 Mozilla 1.4 and Opera 7.1 (on this browsers was tested)

* Please test the script on diferent browsers and diferent versions and send feedback to improve the script
* More support will be added soon

______________

3. How to use
______________

First include the class: include ("time_online.class.php");

REMEMBER THAT THE CLASS MUST BE LOADED BEFORE ANY OTHER HEADERS ARE SENT !!!!

If you want to have access to the array with the times use:
      $test = new time_online;
      $test -> userTO; // array with the time for te current session
      $test -> userTT; // array with the entyre time (from every visit)

If you want to display the time that the user was on the site or page call display_time() with these parameters:
      - display_time("current_page")    -- will display and continues to count the time for the current page (IE 6 Mozilla 1.4 and Opera 7.1 (on this browsers was tested))
      - display_time("current_session") -- will display and continues to count the time for the current session (IE 6 Mozilla 1.4 and Opera 7.1 (on this browsers was tested))
      - display_time("total_time")      -- will display and continues to count the time for all the visits (IE 6 Mozilla 1.4 and Opera 7.1 (on this browsers was tested))

______________

3. Contact
______________

Please send your suggestions, bug reports and general feedback to dragos@protung.ro
Also visit http://www.protung.ro


Out for now ;)
