function go_online(){
	var acceptable = true;
	var uname = get_string_async("Enter a username for this account!","Player1");
	if global.onlineqm == true {
		if (uname == "WushR00M") {
			acceptable = false;
			// nice try dumbass
			show_message_async("That username is taken. Please enter a new one!");
			go_online();
		} else {
			var acceptable = true;
			for(var i = 1; i <= string_length(uname); ++i)
				if string_pos(string_char_at(uname, i), "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_") == 0 {
					acceptable = false;
					show_message_async("Your username is invalid. Please enter a new one!");
					go_online();
			} else {
				var pw = get_string_async("Enter in a secure password only you know and can remember!","");
				global.username = uname;
				global.pw = pw;
				global.userid = random_range(1,1000000);
				ini_open("user.ini");
				ini_write_string("info","uname",global.username);
				ini_write_string("info","uid",global.userid);
				ini_write_string("info","pw", base64_encode(pw));
				ini_close();
				show_message_async("Congratulations! Your account has been created and connected to Sunrise services. It may take a few moments for the account to show up.");
				break;
			}
		}
	} else {
		show_message_async("Congratulations on creating your own Sunrise local account to store your user data. You can always connect to the online services in the Account menu!");	
	}
}