<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpLogin.aspx.cs" Inherits="WebApplication6.SignUpLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="stylesheet" href="SignupLogin.css" />
</head>
<body>
    <div class="PageForm" >
        <div class="PageHeader">
            <div style="width: 210px; height: 100%; padding-left: 30px; display: flex; flex-direction: row; justify-content: space-around; align-items: center;">
                <div class="HeaderLogo"><img class="logo" src="Logo/PDFmaster.png" /></div>
            </div>
        </div>

        <div class="PageTitle">
            <header>Welcome To PDFmaster</header>
            <h1>Register or Login</h1>
        </div>
        

        <div class="Mainbox">

            <div class="informationBox" id="informationBox">
                <div class="login" id="login">
                    <header>Login</header>
                    <div class="headerUnderline"></div>
                    <div class="login-inputs">
                        <div class="input-field" id="Email">
                            <p>Email</p>
                            <div class="Email">
                                <div class="ImagePosition"><img style="height: 23px;" src="Icons/mail.png" /> </div>
                                <input type="text" id="loginEmailVal"/>
                            </div>
                        </div>

                        <div class="input-field" id="Password">
                            <p>Password</p>
                            <div class="Password">
                                <div class="ImagePosition"><img src="Icons/eye.png" id="pwdIcon" onclick="togglePassword();"/></div>
                                <input type="password" id="pwd" />
                            </div>
                            <h1 class="SUEmailerror" id="loginErr">Sorry, we couldn't find your account, please recheck your Email and password</h1>
                        </div>
                    </div>
                    <label class="submitButton">
                        <input type="submit" onclick="loginUser()" />
                        Submit
                    </label>
                    <img class="InsideLogoPic" src="Logo/PDFmaster.png" />
                </div>

                <%--Sign Up--%>

                <div class="signup" id="signup" style="display: none; opacity: 0;">
                    <header>Sign up</header>
                    <div class="headerUnderline"></div>
                    <div class="login-inputs">

                        <div class="input-field" id="Username">
                            <p>Username</p>
                            <div class="Email">
                                <div class="ImagePosition"><img src="Icons/UserIcon.png"/></div>
                                <input type="text" id="usernameVal"/>
                            </div>
                            <h1 class="SUEmailerror" id="UNerror">Please enter your password to continue</h1>
                        </div>

                        <div class="input-field" id="SUEmail">
                            <p>Email</p>
                            <div class="Email">
                                <div class="ImagePosition"><img style="height: 23px;" src="Icons/mail.png" /> </div>
                                <input type="text" id="signupEmailVal"/>
                            </div>
                            <h1 class="SUEmailerror" id="SUEmailerror">Email is already in use</h1>
                        </div>

                        <div class="input-field" id="SUPassword">
                            <p>Password</p>
                            <div class="Password">
                                <div class="ImagePosition"><img src="Icons/eye.png" id="pwdIcon2" onclick="togglePasswordSignup();"/></div>
                                <input type="password" id="pwd2" />
                            </div>
                            <h1 class="SUEmailerror" id="pwd2Err">Email is already in use</h1>
                        </div>
                    </div>
                    
                    <label class="submitButton">
                        
                        <input type="submit" onclick="registerUser()" />
                        Submit
                    </label>
                    <img class="InsideLogoPic" src="Logo/PDFmaster.png" />

                </div>
            </div>

            <div class="loginOrSignup" id="loginOrSignup">
                <div class="signupText" id="ToSignupText">
                    <h1 class="inside-header">New Here?</h1>
                    <h2 class="insdie-text">Sign up and start creating wonderful pdf pages!</h2>
                    <h2 class="signupButton" onclick="ChangeToSignup();">Sign up now!</h2>
                </div>

                <div class="signupText" id="ToLoginText" style="display: none; opacity: 0;">
                    <h1 class="inside-header">Welcome!</h1>
                    <h2 class="insdie-text">To keep connected please enter your personal info</h2>
                    <h2 class="HaveAcc">Already have an account?</h2>
                    <h2 class="signupButton" onclick="ChangeTologin();" style="margin-top: 5px;">Login now!</h2>
                </div>
                

            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const pwd = document.getElementById("pwd");
            const Icon = document.getElementById("pwdIcon");
            
            if (pwd.type === "password") {
                pwd.type = "text";
                Icon.src = "Icons/blind.png";
                Icon.style.height = "33px";
                Icon.style.marginLeft = "-1px";

            }
            else {
                pwd.type = "password";
                Icon.src = "Icons/eye.png";
                Icon.style.height = "29px";
                Icon.style.marginLeft = "0px";

            }
        }

        function togglePasswordSignup() {
            const pwd = document.getElementById("pwd2");
            const Icon = document.getElementById("pwdIcon2");

            if (pwd.type === "password") {
                pwd.type = "text";
                Icon.src = "Icons/blind.png";
                Icon.style.height = "33px";
                Icon.style.marginLeft = "-1px";

            }
            else {
                pwd.type = "password";
                Icon.src = "Icons/eye.png";
                Icon.style.height = "29px";
                Icon.style.marginLeft = "0px";

            }
        }




        function ChangeToSignup() {

            const login = document.getElementById("login");
            const signup = document.getElementById("signup");
            const informationBox = document.getElementById("informationBox");

            const loginOrSignup = document.getElementById("loginOrSignup");
            const ToLoginText = document.getElementById("ToLoginText");
            const ToSignupText = document.getElementById("ToSignupText");
            

            login.style.opacity = 0;
            ToSignupText.style.opacity = 0;

            informationBox.style.height = "585px";
            loginOrSignup.style.height = "587px";
            setTimeout(function () {
                login.style.display = 'none';
                ToSignupText.style.display = 'none';
                signup.style.display = "flex";
                ToLoginText.style.display = "flex";
                
                setTimeout(function () {
                    signup.style.opacity = 1;
                    ToLoginText.style.opacity = 1;
                }, 10); 
            }, 200); 
        }

        function ChangeTologin() {
            
            const login = document.getElementById("login");
            const signup = document.getElementById("signup");
            const informationBox = document.getElementById("informationBox");

            const loginOrSignup = document.getElementById("loginOrSignup");
            const ToLoginText = document.getElementById("ToLoginText");
            const ToSignupText = document.getElementById("ToSignupText");

            signup.style.opacity = 0;
            ToLoginText.style.opacity = 0;
            
            setTimeout(function () {
                informationBox.style.height = "490px";
                loginOrSignup.style.height = "490px";

                signup.style.display = 'none';
                ToLoginText.style.display = 'none';

                login.style.display = "flex";
                ToSignupText.style.display = "flex";

                setTimeout(function () {
                    login.style.opacity = 1;
                    ToSignupText.style.opacity = 1;
                }, 50);
            }, 200); 
        }
    </script>



     <script type="module">
         import { initializeApp } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-app.js";
         import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-auth.js";
         import { getDatabase, ref, set } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-database.js";
         const firebaseConfig = {
             apiKey: "AIzaSyBU169yhXhVUVBnA_-oMKV-JjieBM2KaCI",
             authDomain: "pdfmaster-c097b.firebaseapp.com",
             projectId: "pdfmaster-c097b",
             storageBucket: "pdfmaster-c097b.appspot.com",
             messagingSenderId: "462861287072",
             appId: "1:462861287072:web:2413aaea2b76ff3b6bd3c5",
             databaseURL: "https://pdfmaster-c097b-default-rtdb.europe-west1.firebasedatabase.app"
         };

         const app = initializeApp(firebaseConfig);


         function registerUser() {
             var email = document.getElementById("signupEmailVal").value;
             var emailErr = document.getElementById("SUEmailerror");

             var password = document.getElementById("pwd2").value;
             var passwordErr = document.getElementById("pwd2Err");

             var username = document.getElementById("usernameVal").value;
             var usernameErr = document.getElementById("UNerror");
             emailErr.style.display = "none";
             usernameErr.style.display = "none";
             passwordErr.style.display = "none";


             if (username == "") {
                 usernameErr.style.display = "block";    
             }
             if (password == "") {
                 passwordErr.innerHTML = "Please enter your password to continue"
                 passwordErr.style.display = "block";
             }
             if (email == "") {
                 emailErr.innerHTML = "Please enter a vaild email";
                 emailErr.style.display = "block";
             }
             if (email == "" && password == "" && username == "") {
                 return;
             }



             const auth = getAuth(app);
             createUserWithEmailAndPassword(auth, email, password)
                 .then((userCredential) => {
                     // Signed up 
                     const user = userCredential.user;


                     //Database!
                     const db = getDatabase(app);
                     const userRef = ref(db, 'users/' + user.uid);
                     const userData = {
                         Email: email,
                         Password: password, 
                         Username: username
                     };

                     set(userRef, userData)
                         .then(() => {
                             window.location.href = "PDFmaster.aspx";
                         })
                         .catch((err) => {
                             console.error("Error adding user data to the database:", err);
                         });
                 })
                 .catch((err) => {
                     console.log(err.code);
                     console.log(err.message);
                     if (err.message == "Firebase: Error (auth/email-already-in-use).") {
                         emailErr.innerHTML = "Email is already in use";
                         emailErr.style.display = "block";
                     }
                     if (err.code == "auth/invalid-email") {
                         emailErr.innerHTML = "Please enter a vaild email";
                         emailErr.style.display = "block";
                     }
                     if (err.code == "auth/weak-password") {
                         passwordErr.innerHTML = "Please enter a stronger password";
                         passwordErr.style.display = "block";
                     }
                 });
         }

         window.registerUser = registerUser;




         function loginUser() {
             var email = document.getElementById("loginEmailVal").value;
             var password = document.getElementById("pwd").value;
             var errorMsg = document.getElementById("loginErr");
             errorMsg.style.display = "none";

             const auth = getAuth(app);

             signInWithEmailAndPassword(auth, email, password)
                 .then((userCredential) => {
                     const user = userCredential.user;
                     window.location.href = "PDFmaster.aspx";
                 })
                 .catch((err) => {
                     console.log(err.code);
                     console.log(err.message);
                     if (err.code == "auth/invalid-login-credentials") {
                         errorMsg.innerHTML = "Sorry, we couldn't find your account, please recheck your Email and password"
                         errorMsg.style.display = "block";
                     }
                     if (err.code == "auth/missing-password") {
                         errorMsg.innerHTML = "Please enter your password to continue"
                         errorMsg.style.display = "block";
                     }
                     if (err.code == "auth/invalid-email") {
                         errorMsg.innerHTML = "Please enter a vaild email"
                         errorMsg.style.display = "block";
                     }
                 });
         }

         window.loginUser = loginUser;
     </script> 



</body>
</html>
