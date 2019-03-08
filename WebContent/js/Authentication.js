//用户登录验证
function check() {
	// 用户名
	var name = document.getElementById("login_number");
	if (name.value == '') {
		document.getElementById("lab_type1").innerHTML = "<p style='color:red;'>用户名不能为空！</p>";
		name.focus();
		return false;
	} else {
		var vname = (/^[a-zA-Z\u4e00-\u9fa5]{2,10}$/);
		if (!vname.test(name.value)) {
			document.getElementById("lab_type1").innerHTML = "<p style='color:red;'>用户名2-10个字，只能是中文或英文</p>";
			name.focus();
			return false;
		}
	}
	// 密码
	var pwd1 = document.getElementById('login_password');
	if (pwd1.value == '') {
		document.getElementById("lab_type1").innerHTML = "<p style='color:red;'>密码不能为空！</p>";
		pwd1.focus();
		return false;
	} else {
		var vpwd = /^[A-Za-z0-9]+$/;
		if (!vpwd.test(pwd1.value)) {
			document.getElementById("lab_type1").innerHTML = "<p style='color:red;'>密码错误，密码由数字和字母组成！</p>";
			pwd1.focus();
			return false;
		} else {
			if (pwd1.value.length == 6) {
				document.getElementById("lab_type1").innerHTML = "<p style='color:red;'>密码不少于六位或不多于十六位！</p>";
				pwd1.focus();
				return false;
			}
		}
	}
}
// 用户注册验证
