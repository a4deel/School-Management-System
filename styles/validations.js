//For Alphabets Input only
function alphabetValidation(event) {
    key = event.key;

    if ((" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").indexOf(key) > -1)
        return true;
    else
        return false;
}

//For Numbers
function numbersValidation(event) {
    key = event.key;
    if (("0123456789").indexOf(key) > -1)
        return true;
    else
        return false;
}
//For Login Form Validation
function loginformValidation() {
    var name = false;
    var password = false;

    var nameElm = document.getElementById("name");
    var passwordElm = document.getElementById("password");

    var nameValue = nameElm.value;
    var passwordValue = passwordElm.value;

    if (nameValue) {
        name = true;
        nameElm.classList.remove("error");
        nameElm.classList.add("success");
        document.getElementById('nameError').innerHTML = "";
    } else {
        nameElm.classList.add("error");
        nameElm.classList.remove("success");
        var error = "Please Enter your name";
        document.getElementById('nameError').innerHTML = error;
    }

    if (passwordValue) {
        password = true;
        passwordElm.classList.remove("error");
        passwordElm.classList.add("success");
        document.getElementById('passwordError').innerHTML = ""
    } else {
        passwordElm.classList.add("error");
        passwordElm.classList.remove("success");
        var error = "Please Enter your password";
        document.getElementById('passwordError').innerHTML = error;
    }

    if (!name || !password) {
        return false;
    }
}



//For Register Form Validation
function registerformValidation() {
    var name = false;
    var password = false;
    var confirmPassword = false;
    // var type = false;

    var nameElm = document.getElementById("name");
    var passwordElm = document.getElementById("password");
    var confirmPasswordElm = document.getElementById("confirm_password");
    // var typeElm = document.getElementById("UserType");

    var nameValue = nameElm.value;
    var passwordValue = passwordElm.value;
    var confirmPasswordValue = confirmPasswordElm.value;
    // var typeValue = typeElm.value;

    if (nameValue) {
        name = true;
        nameElm.classList.remove("error");
        nameElm.classList.add("success");
        document.getElementById('nameError').innerHTML = "";
    } else {
        nameElm.classList.add("error");
        nameElm.classList.remove("success");
        var error = "Please Enter your name";
        document.getElementById('nameError').innerHTML = error;
    }

    if (passwordValue) {
        password = true;
        passwordElm.classList.remove("error");
        passwordElm.classList.add("success");
        document.getElementById('passwordError').innerHTML = ""
    } else {
        passwordElm.classList.add("error");
        passwordElm.classList.remove("success");
        var error = "Please Enter your password";
        document.getElementById('passwordError').innerHTML = error;
    }

    if (confirmPasswordValue) {
        confirmPassword = true;
        confirmPasswordElm.classList.remove("error");
        confirmPasswordElm.classList.add("success");
        document.getElementById('confirmPasswordError').innerHTML = "";
    } else {
        confirmPasswordElm.classList.add("error");
        confirmPasswordElm.classList.remove("success");
        var error = "Please Enter your confirm password";
        document.getElementById('confirmPasswordError').innerHTML = error;
    }

    if (passwordValue != confirmPasswordValue) {
        confirmPasswordElm.classList.add("error");
        confirmPasswordElm.classList.remove("success");
        var error = "Confirm password must be same as initial password!";
        document.getElementById('confirmPasswordError').innerHTML = error;
    } else if (passwordValue && confirmPasswordValue && passwordValue == confirmPasswordValue) {
        confirmPasswordElm.classList.remove("error");
        confirmPasswordElm.classList.add("success");
    }

    // if (typeValue) {
    //     type = true;
    //     typeElm.classList.remove("error");
    //     typeElm.classList.add("success");
    //     document.getElementById('typeError').innerHTML = "";
    // } else {
    //     typeElm.classList.add("error");
    //     typeElm.classList.remove("success");
    //     var error = "Please Select your Type";
    //     document.getElementById('typeError').innerHTML = error;
    // }
    if (!name || !password || !confirmPassword || passwordValue != confirmPasswordValue) {
        return false;
    }
}


//For Add Class Form Validation
function addClassformValidation() {
    var className = false;
    var classNameElm = document.getElementById("className");
    var classNameValue = classNameElm.value;

    if (classNameValue) {
        className = true;
        classNameElm.classList.remove("error");
        document.getElementById('classNameError').innerHTML = "";
    } else {
        classNameElm.classList.add("error");
        var error = "Please Enter your Class";
        document.getElementById('classNameError').innerHTML = error;
    }

    if (!className) {
        return false;
    }
}


//For Add Notifications
function addNotifformValidation() {
    var title = false;
    var detail = false;
    var name = false;

    var titleElm = document.getElementById("title");
    var detailElm = document.getElementById("detail");
    var nameElm = document.getElementById("name");

    var titleValue = titleElm.value;
    var detailValue = detailElm.value;
    var nameValue = nameElm.value.trim;

    if (titleValue) {
        title = true;
        titleElm.classList.remove("error");
        document.getElementById('titleError').innerHTML = "";
    } else {
        titleElm.classList.add("error");
        var error = "Please Enter your Notification Title";
        document.getElementById('titleError').innerHTML = error;
    }

    if (detailValue) {
        detail = true;
        detailElm.classList.remove("error");
        document.getElementById('detailError').innerHTML = "";
    } else {
        detailElm.classList.add("error");
        var error = "Please Enter your Notification Detail.";
        document.getElementById('detailError').innerHTML = error;
    }

    if (nameValue) {
        name = true;
        nameElm.classList.remove("error");
        document.getElementById('nameError').innerHTML = "";
    } else {
        nameElm.classList.add("error");
        var error = "Please Enter your name";
        document.getElementById('nameError').innerHTML = error;
    }

    if (!title || !detail || !name) {
        return false;
    }
}


//For Add Teacher
function addTeacherformValidation() {
    var name = false;
    var age = false;
    var phone = false;
    var address = false;

    var nameElm = document.getElementById("name");
    var ageElm = document.getElementById("age");
    var phoneElm = document.getElementById("phone");
    var addressElm = document.getElementById("address");

    var nameValue = nameElm.value;
    var ageValue = ageElm.value;
    var phoneValue = phoneElm.value;
    var addressValue = addressElm.value;

    if (nameValue) {
        name = true;
        nameElm.classList.remove("error");
        document.getElementById('nameError').innerHTML = "";
    } else {
        nameElm.classList.add("error");
        var error = "Please Enter your name";
        document.getElementById('nameError').innerHTML = error;
    }

    if (ageValue) {
        age = true;
        ageElm.classList.remove("error");
        document.getElementById('ageError').innerHTML = "";
    } else {
        ageElm.classList.add("error");
        var error = "Please Enter your Age";
        document.getElementById('ageError').innerHTML = error;
    }

    if (phoneValue) {
        phone = true;
        phoneElm.classList.remove("error");
        document.getElementById('phoneError').innerHTML = "";
    } else {
        phoneElm.classList.add("error");
        var error = "Please Enter your Phone No.";
        document.getElementById('phoneError').innerHTML = error;
    }

    if (addressValue) {
        address = true;
        addressElm.classList.remove("error");
        document.getElementById('addressError').innerHTML = "";
    } else {
        addressElm.classList.add("error");
        var error = "Please Enter your Address";
        document.getElementById('addressError').innerHTML = error;
    }

    if (!name || !age || !phone || !address) {
        return false;
    }
}


//For Add Student
function addStudentformValidation() {
    var name = false;
    var rollNo = false;
    var className = false;
    var phone = false;
    var address = false;

    var nameElm = document.getElementById("name");
    var rollNoElm = document.getElementById("roll");
    var classNameElm = document.getElementById("className");
    var phoneElm = document.getElementById("phone");
    var addressElm = document.getElementById("address");

    var nameValue = nameElm.value;
    var rollNoValue = rollNoElm.value;
    var classNameValue = classNameElm.value;
    var phoneValue = phoneElm.value;
    var addressValue = addressElm.value;

    if (nameValue) {
        name = true;
        nameElm.classList.remove("error");
        document.getElementById('nameError').innerHTML = "";
    } else {
        nameElm.classList.add("error");
        var error = "Please Enter your name";
        document.getElementById('nameError').innerHTML = error;
    }

    if (rollNoValue) {
        rollNo = true;
        rollNoElm.classList.remove("error");
        document.getElementById('rollError').innerHTML = "";
    } else {
        rollNoElm.classList.add("error");
        var error = "Please Enter your Roll-Number";
        document.getElementById('rollError').innerHTML = error;
    }

    if (classNameValue) {
        className = true;
        classNameElm.classList.remove("error");
        document.getElementById('classNameError').innerHTML = "";
    } else {
        classNameElm.classList.add("error");
        var error = "Please Enter your Class";
        document.getElementById('classNameError').innerHTML = error;
    }

    if (phoneValue) {
        phone = true;
        phoneElm.classList.remove("error");
        document.getElementById('phoneError').innerHTML = "";
    } else {
        phoneElm.classList.add("error");
        var error = "Please Enter your Phone No.";
        document.getElementById('phoneError').innerHTML = error;
    }

    if (addressValue) {
        address = true;
        addressElm.classList.remove("error");
        document.getElementById('addressError').innerHTML = "";
    } else {
        addressElm.classList.add("error");
        var error = "Please Enter your Address";
        document.getElementById('addressError').innerHTML = error;
    }

    if (!name || !rollNo || !className || !phone || !address) {
        return false;
    }
}


//For Add TimeTable
function addTimeformValidation() {
    var one = false;
    var two = false;
    var three = false;
    var four = false;
    var five = false;
    var className = false;


    var oneElm = document.getElementById("one");
    var twoElm = document.getElementById("two");
    var threeElm = document.getElementById("three");
    var fourElm = document.getElementById("four");
    var fiveElm = document.getElementById("five");
    var classNameElm = document.getElementById("className");

    var oneValue = oneElm.value;
    var twoValue = twoElm.value;
    var threeValue = threeElm.value;
    var fourValue = fourElm.value;
    var fiveValue = fiveElm.value;
    var classNameValue = classNameElm.value;

    if (oneValue) {
        one = true;
        oneElm.classList.remove("error");
        document.getElementById('oneError').innerHTML = "";
    } else {
        oneElm.classList.add("error");
        var error = "Please Enter Lecture 1 Credentials ";
        document.getElementById('oneError').innerHTML = error;
    }

    if (twoValue) {
        two = true;
        twoElm.classList.remove("error");
        document.getElementById('twoError').innerHTML = "";
    } else {
        twoElm.classList.add("error");
        var error = "Please Enter Lecture 2 Credentials ";
        document.getElementById('twoError').innerHTML = error;
    }

    if (threeValue) {
        three = true;
        threeElm.classList.remove("error");
        document.getElementById('threeError').innerHTML = "";
    } else {
        threeElm.classList.add("error");
        var error = "Please Enter Lecture 3 Credentials ";
        document.getElementById('threeError').innerHTML = error;
    }

    if (fourValue) {
        four = true;
        fourElm.classList.remove("error");
        document.getElementById('fourError').innerHTML = "";
    } else {
        fourElm.classList.add("error");
        var error = "Please Enter Lecture 4 Credentials ";
        document.getElementById('fourError').innerHTML = error;
    }

    if (fiveValue) {
        five = true;
        fiveElm.classList.remove("error");
        document.getElementById('fiveError').innerHTML = "";
    } else {
        fiveElm.classList.add("error");
        var error = "Please Enter Lecture 5 Credentials ";
        document.getElementById('fiveError').innerHTML = error;
    }

    if (classNameValue) {
        className = true;
        classNameElm.classList.remove("error");
        document.getElementById('classNameError').innerHTML = "";
    } else {
        classNameElm.classList.add("error");
        var error = "Please Enter your Class";
        document.getElementById('classNameError').innerHTML = error;
    }


    if (!one || !two || !three || !four || !five || !className) {
        return false;
    }
}

function imageformValidation() {
    var file = false;
    var fileElm = document.getElementById("file");
    var fileValue = fileElm.value;

    if (fileValue) {
        file = true;
        fileElm.classList.remove("error");
        document.getElementById('fileError').innerHTML = "";
    } else {
        fileElm.classList.add("error");
        var error = "Please Select your Image";
        document.getElementById('fileError').innerHTML = error;
    }

    if (!file) {
        return false;
    }
}
