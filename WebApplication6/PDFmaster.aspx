<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDFmaster.aspx.cs" Inherits="WebApplication6.PDFmaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PDFmaster</title>
    <link rel="stylesheet" href="Mainpage.css" />
    <script src="JavaHelper.js"></script>
</head>
<body style="overflow: hidden;">
    <%--POPOUT--%>
    <div id="overlay" class="overlay"></div>
    <div id="overlayInfo" style="display:none; justify-content: center;">
        <div class="newTemaplatePopout">
            <div class="NTheader">
                <p>New template</p>
                <%--Svg format image for close icon--%>
                <svg onclick="CloseOverlay();" class="backButton" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                    <g><path class="backarrow"  d="M480,224H100.5L216.6,84.5c11.3-13.6,9.5-33.8-4.2-45.1s-33.8-9.5-45.1,4.2l-160,192l-2.9,4.8l-2.3,4.2   C0.8,248.2,0,252.1,0,256c0,3.9,0.8,7.8,2.2,11.5l2.3,4.2l2.9,4.8l160,192c6.1,7.3,15.1,11.5,24.6,11.5c7.5,0,14.7-2.6,20.5-7.4   c13.6-11.3,15.5-31.5,4.2-45.1l0-0.1L100.5,288H480c17.7,0,32-14.3,32-32S497.7,224,480,224z"/></g>
                </svg>
            </div>

            <div class="NTinputs">
                <div class="nameInput">
                    <input id="NameVal" type="text" required="required"/>
                    <label class="nameStyle">
                        <span class="inputext">Template's name</span>
                    </label>
                </div>
                <h1 class="NameTaken" id="NameTaken">Template's name is already in use</h1>

                <div class="nameInput" style="margin-top: 30px;">
                    <input id="FileNameVal" type="text" required="required"/>
                    <label class="nameStyle">
                        <span class="inputext">File's name</span>
                    </label>
                </div>
                <h1 class="NameTaken" style="margin-top: 135px;" id="FileNameNoInput">Please enter a file name</h1>


                <span class="NTfileDimensions">File's dimensions</span>
                <div class="selectDisplay"> 
                    <select onchange="UpdateSelectPageDimensions();" class="selectBox" id ="FileSizeVal" required="required">
                        <option selected="selected" value="A4">A4</option>
                        <option value="A3">A3</option>
                        <option value="Letter">Letter</option>
                        <option value="Legal">Legal</option>
                        <option value="Tabloid">Tabloid</option>
                        <option value="Ledger">Ledger</option>
                    </select>
                    <div class="selectIcon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path style="color: white;" fill="currentColor" d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/></svg>
                    </div>
                </div>
                <h1 class="pageDimensions" id="pageDimensions">A4: 210mm x 297mm</h1>


                <div class="CreateTemplate" style="width: 100%; margin-left: -65px; bottom: 150px; position: absolute;">
                    <p onclick="NewTamplateInDatabase();">Create template ✨</p>
                </div>
            </div>
        </div>
    </div>



    <div class="MainDisplay">
        <div class="PageHeader shadow-md">
            <div style="width: 600px; height: 100%; padding-left: 300px; display: flex; flex-direction: row; align-items: center;">
                <div class="HeaderUser"><img style="height: 40px;" src="Icons/UserIcon.png" /></div>
                <div id="Username" class="HeaderText" style="padding-right: 50px;">Hello Your Name!</div>
                <div class="HeaderText">Home Page</div>
            </div>

            <div style="width: 300px; height: 100%; padding-right: 10px; display: flex; flex-direction: row; align-items: center; justify-content: end">
                <div class="HeaderText" style="padding-right: 60px;">Help</div>
            </div>
        </div>


    
        <div class="SideInformation">
            <div class="HeaderLogo"><img class="logo" src="Logo/PDFmaster.png" /></div>
            <div class="SideInformationBG" style="background-color: #92B4EC; color: white;" onclick="ChnageDisplay(0);"><p class="SideInformationText">Templates</p></div>
            <div class="SideInformationBG"><p class="SideInformationText" onclick="ChnageDisplay(1);">Help center</p></div>

            <button class="signout">
                <svg class="signoutIcon SideInformationText" data-prefix="fad" data-icon="arrow-right-from-bracket" aria-hidden="true" focusable="false" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <g ><path class="signouthouse" fill="currentColor" d="M160 416H96c-17.67 0-32-14.33-32-32V128c0-17.67 14.33-32 32-32h64c17.67 0 32-14.33 32-32S177.7 32 160 32H96C42.98 32 0 74.98 0 128v256c0 53.02 42.98 96 96 96h64c17.67 0 32-14.33 32-32S177.7 416 160 416z"></path><path class="signoutarrow" fill="currentColor" d="M502.6 278.6l-128 128c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25L402.8 288H192C174.3 288 160 273.7 160 256s14.31-32 32-32h210.8l-73.38-73.38c-12.5-12.5-12.5-32.75 0-45.25c12.49-12.49 32.74-12.51 45.25 0l128 128C515.1 245.9 515.1 266.1 502.6 278.6z"></path></g>
                </svg>
                <p class="SignOutText" onclick="logoutUser();">Sign out</p>
            </button>
        </div>


        <div class="Templates displays">
            <div class="TextAndImage"> <div style="font-size: 42px;">Your Templates</div> <img style="height: 52px; padding-left: 15px;" src="Icons/TemplateIcon2.png" /> </div>
            
                <%--<div class="ButtonToTemplates">
                    <div class="BTTinformation">
                        <p class="BTTinformationName">Template Name</p>
                        <img class="delete" src="Icons/delete.png" onclick=""/>
                        <div class="deleteConfirm"><p>Are you sure?</p></div>
                    </div>
                    <p class="BTTinformationID">Template's ID:</p>
                </div>--%>
            <div id="templatesContainer">
            </div>
            <div class="CreateTemplate">
                <p onclick="OpenOverlay();">Create new template ✨</p>
            </div>
        </div>

        <div style="display: none;" class="Templates displays">
            <div style="font-size: 42px;">Help Center</div>

            <div style="font-size: 20px; padding-top: 100px;">Know the Basics:</div>
            <p class="HelpText">In order to start creating wonderful templates, please create your first template by clicking "Create new template" button. </p>
            <div class="CreateTemplate">
                <p onclick="OpenOverlay();">Create new template ✨</p>
            </div>
            <p class="HelpText">In your template you'll see 3 tabs - HTML, CSS and Incoming Data </p>

            <div style="font-size: 20px; padding-top: 70px;">Start Working!</div>
            <p class="HelpText">Once you have created your template, you can start writing HTML and CSS code and design your template, the coding works exactly as Visual Studio Code and we will help auto complete lines.   </p>
            <p class="HelpText">Next to the coding area there is a preview to your PDF file, each time you'll click the Save button the preview will refresh.  </p>

            <div style="font-size: 20px; padding-top: 70px;">How to connect a template to your client?</div>
            <p class="HelpText">You don't have to worry about anything! we will take care of the connection.   </p>
            <p class="HelpText">In order to make a connection please copy these lines to your code:  </p>
            <div id="Code" class="HelpCode"></div>
            <p class="HelpText">Make sure to change ID to your user ID, template to your desired template, and additionalParams to your parameter's name and value as written in the Incoming data section  </p>


        </div>
    </div>
    <script src="https://unpkg.com/monaco-editor/min/vs/loader.js"></script>
    <script>

        const Overlay = document.getElementById("overlay");
        const OverlayInfo = document.getElementById("overlayInfo");

        function OpenOverlay() {
            Overlay.style.display = "block";
            OverlayInfo.style.display = "flex";
        }
        function CloseOverlay() {
            Overlay.style.display = "none";
            OverlayInfo.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target === Overlay) {
                CloseOverlay();
            }
            const ConfirmDelete = document.getElementsByClassName("deleteConfirm");
            const Delete = document.getElementsByClassName("delete");
            for (var i = 0; i < ConfirmDelete.length; i++) {
                if (event.target !== ConfirmDelete[i] && event.target !== Delete[i]) {
                    ConfirmDelete[i].style.opacity = 0;
                }
            }
            setTimeout(function () {
                const ConfirmDelete = document.getElementsByClassName("deleteConfirm");
                const Delete = document.getElementsByClassName("delete");
                for (var i = 0; i < ConfirmDelete.length; i++) {
                    if (event.target !== ConfirmDelete[i] && event.target !== Delete[i]) {
                        ConfirmDelete[i].style.display = "none";
                    }
                }
            }, 150);

        }

        function UpdateSelectPageDimensions() {
            var h1Element = document.getElementById("pageDimensions");
            var index = document.getElementById("FileSizeVal").selectedIndex;
            var dimensions = ["A4: 210mm x 297mm", "A3: 297mm x 420mm", "Letter: 215.9mm x 279.4mm", "Legal: 215.9mm x 355.6mm", "Tabloid: 279.4mm x 431.8mm", " Ledger: 431.8mm x 279.4mm"];

            h1Element.innerHTML = dimensions[index];
        }
        
    </script>

    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-app.js";
        import { getAuth, signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-auth.js";
        import { getDatabase, ref, set, get, remove } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-database.js";
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

        
        function logoutUser() {
            const auth = getAuth(app);

            signOut(auth)
                .then(() => {
                    window.location.href = "SignUpLogin.aspx";
                })
        }
        window.logoutUser = logoutUser;


        //Display Username
        const auth = getAuth(app);
        const db = getDatabase(app);

        onAuthStateChanged(auth, (user) => {
            const usernameDisplay = document.getElementById("Username");

            if (user) {
                console.log("User is signed in:", user.uid);

                const userRef = ref(db, 'users/' + user.uid);

                get(userRef)
                    .then((snapshot) => {
                        const userData = snapshot.val();
                        if (userData && userData.Username) {
                            const username = userData.Username;
                            usernameDisplay.innerHTML = `Hello, ${username}!`;
                        }
                    })
                    
            }
            else {
                console.log("User is signed out.");
                window.location.href = "SignUpLogin.aspx";
                usernameDisplay.textContent = "";
            }


            var editor;
            const userID = user.uid + "',";
            console.log(userID);
            var value = `
function sendData() {
    const data = {
        ID: '`
                + userID+`
        template: 'Your Template name',
        additionalParams: JSON.stringify({
            "paramter1": "value",
            "parameter2": "value"
        })
    };
    //fetch is used to make network requests
    fetch('http://20.217.17.129/pdf/receivedata', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        const filename = response.headers.get('X-Filename');
        return response.blob().then(blob => ({
            blob,
            filename
        }));
    })
    .then(({ blob, filename }) => {
        //We receive a binary response; blob is for handling it

        //converting the binary PDF to a URL and then downloading it
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename || 'default-filename.pdf';
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);
    })
    .catch(error => console.error('Error:', error));
};
`;
            require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor/min/vs' } });

            require(['vs/editor/editor.main'], function () {
                monaco.languages.html.htmlDefaults.setOptions({
                    // Theoretically Enable JavaScript and CSS to html but...
                    autoClosingTags: true,
                    format: {
                        enable: true,
                    },
                    suggest: {
                        html5: true,
                        angular1: false,
                        ionic: false,
                    },
                });


                editor = monaco.editor.create(document.getElementById('Code'), {
                    value: value,
                    language: 'javascript',
                    theme: 'vs-dark',
                    automaticLayout: true,
                    autoClosingTags: true, //Not working
                    scrollBeyondLastLine: false,
                    readOnly: true,
                    minimap: { enabled: false }
                });
            });






            function UpdateTemplates() {

                if (user) {
                    const templatesRef = ref(db, `users/${user.uid}/Templates`);

                    get(templatesRef)
                        .then((snapshot) => {
                            const templateContainer = document.getElementById("templatesContainer");
                            templateContainer.innerHTML = "";
                    
                            snapshot.forEach((childSnapshot) => {
                                const folderName = childSnapshot.key;
                                const templatesFilenameRef = ref(db, `users/${user.uid}/Templates/${folderName}/filename`);
                                const templatesfiledimensioneRef = ref(db, `users/${user.uid}/Templates/${folderName}/filedimension`);
                                
                                // Create the elements
                                const div1 = document.createElement("div");
                                div1.className = "ButtonToTemplates";
                                /*div1.onclick = function () {window.location.href = `Coding.aspx?template=` + folderName };*/
                            
                                const div2 = document.createElement("div");
                                div2.className = "BTTinformation";
                            
                                const pElement = document.createElement("p");
                                pElement.className = "BTTinformationName";
                                pElement.textContent = folderName;
                                pElement.onclick = function () { window.location.href = `Coding.aspx?template=` + folderName };

                                const imgElement = document.createElement("img");
                                imgElement.className = "delete";
                                imgElement.src = "Icons/delete.png";

                                const confirmDeleteDiv = document.createElement("div");
                                confirmDeleteDiv.className = "deleteConfirm";

                                const pConfirmText = document.createElement("p");
                                pConfirmText.textContent = "Are you sure?";

                                imgElement.onclick = function () {
                                    confirmDeleteDiv.style.display = "flex";
                                    confirmDeleteDiv.style.opacity = 1;
                                }

                                const pElement2 = document.createElement("p");
                                pElement2.className = "BTTinformationID";
                                pElement2.textContent = "Template's ID:";

                            
                                div1.appendChild(div2);
                                div2.appendChild(pElement);
                                div2.appendChild(imgElement);
                                div2.appendChild(confirmDeleteDiv);
                                confirmDeleteDiv.appendChild(pConfirmText);

                                get(templatesFilenameRef)
                                    .then((snapshot) => {
                                        const pElement2 = document.createElement("p");
                                        pElement2.className = "BTTinformationID";
                                        pElement2.textContent = "File's name: " + snapshot.val();

                                        div1.appendChild(pElement2);

                                    })
                                get(templatesfiledimensioneRef)
                                    .then((snapshot) => {
                                        const pElement2 = document.createElement("p");
                                        pElement2.className = "BTTinformationID";
                                        pElement2.textContent = "File's dimension: " + snapshot.val();

                                        div1.appendChild(pElement2);

                                    })


                                templateContainer.appendChild(div1);

                                /*Add the Delete Function in the database*/
                                confirmDeleteDiv.onclick = function () {
                                    if (user) {
                                        const templatePath = `users/${user.uid}/Templates/${folderName}`;

                                        const folderRef = ref(db, templatePath);

                                        remove(folderRef)
                                            .then(() => {
                                                console.log(`Folder "${folderName}" deleted successfully!`);
                                                UpdateTemplates()
                                            })
                                            
                                    }
                                }
                            });
                        });
                }
            }
            UpdateTemplates();
        });
    

        function NewTamplateInDatabase() {
            const folderName = document.getElementById("NameVal").value;
            const NameTaken = document.getElementById("NameTaken");
            const FileNameNoInput = document.getElementById("FileNameNoInput");
            var ErrorInInputs = false;
            const FileName = document.getElementById("FileNameVal").value;
            const FileSize = document.getElementById("FileSizeVal").value;
            var value = [
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                ''
            ].join('\n');

            var Jvalue = [
                '{',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '}'
            ].join('\n');

            NameTaken.style.display = "none";
            FileNameNoInput.style.display = "none";


            if (folderName == "") {
                NameTaken.innerHTML = "Please enter a name"
                NameTaken.style.display = "block";
                ErrorInInputs = true;
            }
            if (FileName == "") {
                FileNameNoInput.style.display = "block";
                ErrorInInputs = true;
            }
            if (ErrorInInputs) {
                return;
            }

            const auth = getAuth(app);
            const user = auth.currentUser;

            if (user) {
                const templatesRef = ref(db, `users/${user.uid}/Templates/${folderName}`);

                //already exists?
                get(templatesRef)
                    .then((snapshot) => {
                        if (!snapshot.exists()) {
                            // If Not
                            set(templatesRef, { name: folderName, code: value, style: value, json: Jvalue, filename: FileName, filedimension: FileSize })
                                .then(() => {

                                    window.location.href = `Coding.aspx?template=` + folderName;
                                })
                        }
                        else {
                            NameTaken.innerHTML = "Template's name is already in use";
                            NameTaken.style.display = "block";
                        }
                    })
            }
        }
        window.NewTamplateInDatabase = NewTamplateInDatabase;
        

    </script>

</body>
</html>
