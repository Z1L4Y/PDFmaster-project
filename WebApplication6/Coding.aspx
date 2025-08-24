<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coding.aspx.cs" Inherits="WebApplication6.Coding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coding Platform</title>
    <link rel="stylesheet" href="Style.css" />
    <script src="JavaHelper.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>



    <form action="/Pdf/GeneratePdfForPreview" id="pdfForm" method="post" style=" width: 100%; height: 100%; overflow: hidden;">
    <div class="Coding-Page shadow-md" style="overflow: hidden;">
        <div class="Header">
            <div class="Back" onclick="BackButton();">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M41.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 256 246.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
            </div>

            <div class="FileName"> 
                <h1 id="FileName">File Name</h1>
            </div>
            <div class="headerButtons">
              
                <label class="SaveButton">
                    <input type="submit" id="SaveButton" style="height: 100%; width: 100%;" onclick="saveCodeToDatabase();" formaction="/Pdf/GeneratePdf"/>
                    <h1 style="font-size: 17px; align-self: center;">Download</h1>
                </label>

                <label class="SaveButton" onclick="saveCodeToDatabase()">
                    <%--<button id="previewButton" style="display: none;">Preview PDF</button>--%>
                    <input type="submit" id="previewButton"  />
                    <h1>Save</h1>
                </label>


            </div>
        </div>
    </div>


    <div class="CodingArea">
        <div class="Coding">
            <div class="CodingHeader">
                <div class="Content">
                    <div class="OptionContent">
                        <div name="CodeHeader" class="ContentHeader" onclick="CodeHeader(0);" onmouseover="CodeHeaderHover(0);" onmouseout="CodeHeaderHoverOut(0);" style="background-color: #4e4e4ec9;"><h1>HTML</h1></div>
                        <div name="CodeHeader" class="ContentHeader" onclick="CodeHeader(1);" onmouseover="CodeHeaderHover(1);" onmouseout="CodeHeaderHoverOut(1);"><h1>CSS</h1></div>
                        <div name="CodeHeader" class="ContentHeader" onclick="CodeHeader(2);" onmouseover="CodeHeaderHover(2);" onmouseout="CodeHeaderHoverOut(2);"><h1>Incoming Data</h1></div>
                    </div>

                    <div class="SettingsDiv">
                        <svg class="SettingsIcon" onclick="CodeHeader(3);" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="144" height="144" viewBox="0 0 48 48"><path class="SettingsPath" fill="currentColor" d="M 24 4 C 22.423103 4 20.902664 4.1994284 19.451172 4.5371094 A 1.50015 1.50015 0 0 0 18.300781 5.8359375 L 17.982422 8.7382812 C 17.878304 9.6893592 17.328913 10.530853 16.5 11.009766 C 15.672739 11.487724 14.66862 11.540667 13.792969 11.15625 L 13.791016 11.15625 L 11.125 9.9824219 A 1.50015 1.50015 0 0 0 9.4257812 10.330078 C 7.3532865 12.539588 5.7626807 15.215064 4.859375 18.201172 A 1.50015 1.50015 0 0 0 5.4082031 19.845703 L 7.7734375 21.580078 C 8.5457929 22.147918 9 23.042801 9 24 C 9 24.95771 8.5458041 25.853342 7.7734375 26.419922 L 5.4082031 28.152344 A 1.50015 1.50015 0 0 0 4.859375 29.796875 C 5.7625845 32.782665 7.3519262 35.460112 9.4257812 37.669922 A 1.50015 1.50015 0 0 0 11.125 38.015625 L 13.791016 36.841797 C 14.667094 36.456509 15.672169 36.511947 16.5 36.990234 C 17.328913 37.469147 17.878304 38.310641 17.982422 39.261719 L 18.300781 42.164062 A 1.50015 1.50015 0 0 0 19.449219 43.460938 C 20.901371 43.799844 22.423103 44 24 44 C 25.576897 44 27.097336 43.800572 28.548828 43.462891 A 1.50015 1.50015 0 0 0 29.699219 42.164062 L 30.017578 39.261719 C 30.121696 38.310641 30.671087 37.469147 31.5 36.990234 C 32.327261 36.512276 33.33138 36.45738 34.207031 36.841797 L 36.875 38.015625 A 1.50015 1.50015 0 0 0 38.574219 37.669922 C 40.646713 35.460412 42.237319 32.782983 43.140625 29.796875 A 1.50015 1.50015 0 0 0 42.591797 28.152344 L 40.226562 26.419922 C 39.454197 25.853342 39 24.95771 39 24 C 39 23.04229 39.454197 22.146658 40.226562 21.580078 L 42.591797 19.847656 A 1.50015 1.50015 0 0 0 43.140625 18.203125 C 42.237319 15.217017 40.646713 12.539588 38.574219 10.330078 A 1.50015 1.50015 0 0 0 36.875 9.984375 L 34.207031 11.158203 C 33.33138 11.54262 32.327261 11.487724 31.5 11.009766 C 30.671087 10.530853 30.121696 9.6893592 30.017578 8.7382812 L 29.699219 5.8359375 A 1.50015 1.50015 0 0 0 28.550781 4.5390625 C 27.098629 4.2001555 25.576897 4 24 4 z M 24 7 C 24.974302 7 25.90992 7.1748796 26.847656 7.3398438 L 27.035156 9.0644531 C 27.243038 10.963375 28.346913 12.652335 30 13.607422 C 31.654169 14.563134 33.668094 14.673009 35.416016 13.904297 L 37.001953 13.207031 C 38.219788 14.669402 39.183985 16.321182 39.857422 18.130859 L 38.451172 19.162109 C 36.911538 20.291529 36 22.08971 36 24 C 36 25.91029 36.911538 27.708471 38.451172 28.837891 L 39.857422 29.869141 C 39.183985 31.678818 38.219788 33.330598 37.001953 34.792969 L 35.416016 34.095703 C 33.668094 33.326991 31.654169 33.436866 30 34.392578 C 28.346913 35.347665 27.243038 37.036625 27.035156 38.935547 L 26.847656 40.660156 C 25.910002 40.82466 24.973817 41 24 41 C 23.025698 41 22.09008 40.82512 21.152344 40.660156 L 20.964844 38.935547 C 20.756962 37.036625 19.653087 35.347665 18 34.392578 C 16.345831 33.436866 14.331906 33.326991 12.583984 34.095703 L 10.998047 34.792969 C 9.7799772 33.330806 8.8159425 31.678964 8.1425781 29.869141 L 9.5488281 28.837891 C 11.088462 27.708471 12 25.91029 12 24 C 12 22.08971 11.087719 20.290363 9.5488281 19.160156 L 8.1425781 18.128906 C 8.8163325 16.318532 9.7814501 14.667839 11 13.205078 L 12.583984 13.902344 C 14.331906 14.671056 16.345831 14.563134 18 13.607422 C 19.653087 12.652335 20.756962 10.963375 20.964844 9.0644531 L 21.152344 7.3398438 C 22.089998 7.1753403 23.026183 7 24 7 z M 24 16 C 19.599487 16 16 19.59949 16 24 C 16 28.40051 19.599487 32 24 32 C 28.400513 32 32 28.40051 32 24 C 32 19.59949 28.400513 16 24 16 z M 24 19 C 26.779194 19 29 21.220808 29 24 C 29 26.779192 26.779194 29 24 29 C 21.220806 29 19 26.779192 19 24 C 19 21.220808 21.220806 19 24 19 z"></path></svg>
                    </div>
                </div>
            </div>

            <div class="CodingBox">
                <div id="Code" class="DisplayCode"></div>
                <input id="CodeVal" name="Code" type="text" style="display: none;" />

                <div id="Style" class="DisplayCode" style="z-index: -1; position: absolute;"></div>
                <input id="StyleVal" name="Style" type="text" style="display: none;" />

                <div id="Json" class="DisplayCode" style="display: none;"></div>
                <input id="JsonVal" name="JsonData" type="text" style="display: none;" />

                <div id="Settings" class="DisplayCode" style="display: none;">
                    <div class ="settingsDisplay">
                        <div class="settingsHeader"><header>PDF File Settings</header></div>

                        <%--Same style From Main Page--%>
                        <div class="NTinputs">
                            <div class="nameInput">
                                <input name="GeneratedFileName" style="background: none; color: white" id="NameVal" type="text"/>
                                <label class="nameStyle">
                                    <span class="inputext">File's name</span>
                                </label>
                            </div>
                        </div>

                        <%--Select Box--%>
                        <div class="selectDisplay"> 
                            <select onchange="UpdateSelectPageDimensions();" name="FileSize" class="selectBox" id="selectBox">
                                <option value="A4">A4</option>
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
                        <h1 class="pageDimensions" id="pageDimensions"></h1>


                        <div class="SaveSettings" style="width: 100%; position: absolute;">
                            <p onclick="saveSettingsToDatabase();">Save Settings</p>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <div class="Preview">
            <iframe id="pdfViewer" style="width: 100%; border: none;"></iframe>
        </div>

        
    </div>

    </form>
    <script src="https://unpkg.com/monaco-editor/min/vs/loader.js"></script>
    <script type="module">
        var editor;
        var editorCSS;
        var editorJSON;
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
        ]
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
        ]
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
                value: value.join('\n'),
                language: 'html',
                theme: 'vs-dark',
                automaticLayout: true,
                autoClosingTags: true, //Not working
                minimap: { enabled: false }
            });
            document.getElementById('Code').style.width = "100%";
            editorCSS = monaco.editor.create(document.getElementById('Style'), {
                value: value.join('\n'),
                language: 'css',
                theme: 'vs-dark',
                automaticLayout: true,
                minimap: { enabled: false }
            });
            editorJSON = monaco.editor.create(document.getElementById('Json'), {
                value: Jvalue.join('\n'),
                language: 'json',
                theme: 'vs-dark',
                automaticLayout: true,
                minimap: { enabled: false }
            });
        });


        function UpdateSelectPageDimensions() {
            var h1Element = document.getElementById("pageDimensions");
            var index = document.getElementById("selectBox").selectedIndex;
            var dimensions = ["A4: 210mm x 297mm", "A3: 297mm x 420mm", "Letter: 215.9mm x 279.4mm", "Legal: 215.9mm x 355.6mm", "Tabloid: 279.4mm x 431.8mm", " Ledger: 431.8mm x 279.4mm"];

            h1Element.innerHTML = dimensions[index];
        }
        window.UpdateSelectPageDimensions = UpdateSelectPageDimensions;

        function UpdateCodeVal() {
            var CodeVal = document.getElementById("CodeVal");
            CodeVal.value = editor.getValue();
            var StyleVal = document.getElementById("StyleVal");
            StyleVal.value = editorCSS.getValue();
            var JsonVal = document.getElementById("JsonVal");
            JsonVal.value = editorJSON.getValue();
        }
        window.UpdateCodeVal = UpdateCodeVal;
        


        /*Control + S for saving and showing the preview*/
        function CtrlS(event) {
            if ((event.ctrlKey) && event.key === 's') {
                event.preventDefault();
                UpdateCodeVal();
                const submitButton = document.getElementById('previewButton');
                submitButton.click();
            }
        }
        document.addEventListener('keydown', CtrlS);


        /*DATABASE*/
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-app.js";
        import { getAuth, signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-auth.js";
        import { getDatabase, ref, set, get } from "https://www.gstatic.com/firebasejs/10.5.0/firebase-database.js";
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
        const urlParams = new URLSearchParams(window.location.search);
        const templateName = urlParams.get('template');
        document.getElementById("FileName").innerHTML = templateName;



        const auth = getAuth(app);
        const db = getDatabase(app);
        const saveButton = document.getElementById("Save");

        //If user is signed in
        onAuthStateChanged(auth, (user) => {
            if (user) {

                const codeRef = ref(db, `users/${user.uid}/Templates/${templateName}/code`);
                const styleRef = ref(db, `users/${user.uid}/Templates/${templateName}/style`);
                const jsonRef = ref(db, `users/${user.uid}/Templates/${templateName}/json`);
                const FileNameRef = ref(db, `users/${user.uid}/Templates/${templateName}/filename`);
                const FileSizeRef = ref(db, `users/${user.uid}/Templates/${templateName}/filedimension`);
                get(styleRef)
                    .then((snapshot) => {
                        const styleValue = snapshot.val();

                        editorCSS.setValue(styleValue);
                    })
                get(jsonRef)
                    .then((snapshot) => {
                        const jsonValue = snapshot.val();

                        editorJSON.setValue(jsonValue);
                    })
                    
                get(FileNameRef)
                    .then((snapshot) => {
                        document.getElementById("NameVal").value = snapshot.val();
                    })

                get(FileSizeRef)
                    .then((snapshot) => {
                        document.getElementById("selectBox").value = snapshot.val();
                    })

                get(codeRef)
                    .then((snapshot) => {
                        const codeValue = snapshot.val();

                        editor.setValue(codeValue);
                        document.getElementById("previewButton").click();
                    })

                    
            }
            else {
                console.log("User is not signed in");
            }
        });
            
        function saveCodeToDatabase() {
            UpdateCodeVal();
            onAuthStateChanged(auth, (user) => {
                if (user) {

                    const codeRef = ref(db, `users/${user.uid}/Templates/${templateName}/code`);
                    const codeValue = editor.getValue();

                    const styleRef = ref(db, `users/${user.uid}/Templates/${templateName}/style`);
                    const styleValue = editorCSS.getValue();

                    const jsonRef = ref(db, `users/${user.uid}/Templates/${templateName}/json`);
                    const jsonValue = editorJSON.getValue();

                    //const FileNameRef = ref(db, `users/${user.uid}/Templates/${templateName}/filename`);
                    //const FileName = document.getElementById("NameVal").value

                    //const FileSizeRef = ref(db, `users/${user.uid}/Templates/${templateName}/filedimension`);
                    //const FileSize = document.getElementById("selectBox").value


                    set(codeRef, codeValue) 
                    set(styleRef, styleValue)
                    set(jsonRef, jsonValue)
                    //set(FileNameRef, FileName)
                    //set(FileSizeRef, FileSize)
                        
                }
                else {
                    console.log("User is not signed in");
                }
            });
        }
        window.saveCodeToDatabase = saveCodeToDatabase;



        function saveSettingsToDatabase() {
            onAuthStateChanged(auth, (user) => {
                if (user) {
                    const FileNameRef = ref(db, `users/${user.uid}/Templates/${templateName}/filename`);
                    const FileName = document.getElementById("NameVal").value

                    const FileSizeRef = ref(db, `users/${user.uid}/Templates/${templateName}/filedimension`);
                    const FileSize = document.getElementById("selectBox").value

                    set(FileNameRef, FileName)
                    set(FileSizeRef, FileSize)
                    document.getElementById("previewButton").click();

                }
                else {
                    console.log("User is not signed in");
                }
            });
        }
        window.saveSettingsToDatabase = saveSettingsToDatabase;
    </script>

    <script>
        document.getElementById("previewButton").addEventListener("click", function () {
            UpdateCodeVal();
            console.log("Button clicked!");
            event.preventDefault();
            console.log("Prevent default executed!");
            // Change the Action of the form
            var form = document.getElementById("pdfForm");
            var formData = new FormData(form);

            fetch(form.action, {
                method: form.method,
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    if (data.pdfDataUrl) {
                        var pdfViewer = document.getElementById("pdfViewer");
                        pdfViewer.src = data.pdfDataUrl;
                    } else {
                        console.error("Error:", data.error);
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                });
        });
    </script>
    <script>
        
        function BackButton() {
            saveCodeToDatabase();
            window.location.href = (`PDFmaster.aspx`);
        }
    </script>
</body>
</html>
