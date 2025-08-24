<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighlightedSyntax.aspx.cs" Inherits="WebApplication6.HighlightedSyntax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://unpkg.com/codemirror/codemirror.min.css"/>
    <link rel="stylesheet" href="https://unpkg.com/codemirror/theme/one-dark.min.css"/>



    
</head>
<body>
    <div id="container" style="height:600px; border:1px solid grey"></div>

    <script src="https://unpkg.com/monaco-editor/min/vs/loader.js"></script>
    <script type="module">
        require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor/min/vs' } });

        require(['vs/editor/editor.main'], function () {
            monaco.languages.html.htmlDefaults.setOptions({
                // Enable HTML5 tags, JavaScript, and CSS completions in HTML
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


            var editor = monaco.editor.create(document.getElementById('container'), {
                value: [
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
            ].join('\n'),
            language: 'html',
            theme: 'vs-dark',
            autoClosingTags: true,
            minimap: { enabled: false }
        });
    });
    </script>

</body>
    
</html>
