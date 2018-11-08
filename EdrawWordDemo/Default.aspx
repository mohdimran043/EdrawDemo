<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EdrawWordDemo.Default" %>


<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Edraw Viewer Component for Word Demo - EdrawSoft</title>
    <style>
        <!--
        .Hlink {
            cursor: hand;
            text-decoration: underline;
            color: #0066CC;
            font-weight: normal;
        }
        -->
    </style>
</head>
<script src="Scripts/jquery-3.3.1.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        OpenFromServer();
    });
</script>
<script id="clientEventHandlersJS" language="javascript">
<!--

    function OpenFromLocal() {
        document.all.OA1.OpenFileDialog();
        //You can call the Open method to open silently.
    }

    function OpenFromServer() {
        var sPath = "http://localhost:6767/Repository/Demo.docx";
        document.all.OA1.Open(sPath);


    }
    function Readbookmark_Example() {
        //var count = document.all.OA1.GetBookmarkCount();
        //for (var i = 1; i <= count; i++) {
        //    var name = document.all.OA1.GetBookmarkInfo(i, true);
        //    var value = document.all.OA1.GetBookmarkInfo(i, false);
        //    alert(name + '--' + value);
        //}
        //var objWord = document.OA1.ActiveDocument;
        //document.OA1.GotoItem(101, 0);
        //var WTable = objWord.Tables;
        //debugger
        document.all.OA1.ReplaceText("SIGN IS HERE", "PlEASE WORK", false, false);
        document.all.OA1.ReplaceText("*_____________*", "++++++++++", false, false);
        document.all.OA1.ReplaceText("*_____________*", "++++++++++", false, false);

    }
    function CreateNew() {
        document.all.OA1.NewDoc();
    }

    function PrintDoc() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.PrintDialog();
        }
    }

    function PrintPreview() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.PrintPreview();
        }
    }

    function ProtectDocOnlyRevisions() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.ProtectDoc(0);//wdAllowOnlyRevisions
        }
    }

    function ProtectDocOnlyForm() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.ProtectDoc(2);//wdAllowOnlyFormFields
        }
    }

    function UnProtectDoc() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.UnProtectDoc();
        }
    }

    function DocIsDirty() {
        if (document.all.OA1.IsOpened()) {
            if (document.OA1.IsDirty) {
                window.alert("The file has been modified!");
            }
            else {
                window.alert("The file hasn't been modified!");
            }
        }
    }

    function ShowHideToolbar() {
        if (document.all.OA1.IsOpened()) {
            var x = document.OA1.Toolbars;
            document.OA1.ShowMenubar(!x);
            document.OA1.Toolbars = !x;
        }
    }

    function DisableHotKey() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.DisableSaveHotKey(true);
            document.all.OA1.DisablePrintHotKey(true);
            document.all.OA1.DisableCopyHotKey(true);
        }
    }

    function DisableDragDrop() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.DisableDragAndDrop(true);
        }
    }

    function DisableRightClick() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.DisableViewRightClickMenu(true);
        }
    }

    function SaveAs() {
        if (document.all.OA1.IsOpened()) {
            document.all.OA1.SaveFileDialog();
            //You can call the SaveAs method to save silently.
        }
    }

    function SavetoServer() {
        if (document.OA1.IsOpened) {
            document.OA1.HttpInit();

            var sFileName = document.OA1.GetDocumentName();

            document.OA1.HttpAddPostOpenedFile(sFileName); //save as the same file format with the sFileName then upload
            //document.OA1.HttpAddPostOpenedFile (sFileName, 12); //save as docx file then upload
            //document.OA1.HttpAddPostOpenedFile (sFileName, 0); //save as doc file then upload

            document.OA1.HttpPost("http://www.ocxt.com/demo/upload_weboffice.php");
            if (document.OA1.GetErrorCode() == 0 || document.OA1.GetErrorCode() == 200) {
                var sPath = "Save successfully! You can download it at http://www.ocxt.com/demo/" + sFileName;
                window.alert(sPath);
            }
            else {
                window.alert("you need enable the IIS Windows Anonymous Authentication if you have not set the username and password in the HttpPost method. you need set the timeout and largefile size in the web.config file.");
            }
        }
        else {
            window.alert("Please open a document firstly!");
        }
    }

    function CloseDoc() {
        if (document.OA1.IsOpened) {
            document.all.OA1.CloseDoc();
        }
    }

    function VBAProgramming() {
        if (document.OA1.IsOpened) {
            var objWord = document.OA1.ActiveDocument;
            document.OA1.GotoItem(101, 0);//move to start.
            document.OA1.InsertBreak(6);//insert a line break
            var range = objWord.Range(0, 0);
            var WTable = objWord.Tables.Add(range, 3, 3);
            WTable.Cell(1, 1).Range.Font.Name = "Times New Roman";
            WTable.Cell(1, 1).Range.Text = "Automation 1";
            WTable.Cell(1, 2).Range.Font.Size = 18;
            WTable.Cell(1, 2).Range.Bold = true;
            WTable.Cell(1, 2).Range.Font.Italic = true;
            WTable.Cell(1, 2).Range.Text = "Automation 2";
            WTable.Cell(2, 1).Range.ParagraphFormat.Alignment = 1; // 0= Left, 1=Center, 2=Right   
            WTable.Cell(2, 1).Range.Font.Name = "Arial";
            WTable.Cell(2, 1).Range.Font.Size = 12;
            WTable.Cell(2, 1).Range.Bold = false;
            WTable.Cell(2, 1).Range.ParagraphFormat.Alignment = 2;
            WTable.Cell(3, 3).Range.Font.Name = "Times New Roman";
            WTable.Cell(3, 3).Range.Font.Size = 14;
            WTable.Cell(3, 3).Range.Bold = true;
            WTable.Cell(3, 3).Range.Font.Underline = true;
            WTable.Cell(3, 3).Range.ParagraphFormat.Alignment = 0;
            WTable.Cell(3, 2).Range.Text = "Automation 3";
        }
    }

    function OA1_NotifyCtrlReady() {
        //disalbe the save button and save as button
        document.OA1.DisableFileCommand(1, true);//wdUIDisalbeOfficeButton
        document.OA1.DisableFileCommand(2, true);//wdUIDisalbeNew
        document.OA1.DisableFileCommand(4, true);//wdUIDisalbeOpen
        //If you want to open a document when the page loads, you should put the code here.
        //document.all.OA1.Open("http://www.ocxt.com/demo/samples/sample.doc");
        document.OA1.SetValue("ShowWindowInTaskbar", "TRUE");
        document.OA1.LicenseName = "";
        document.OA1.LicenseCode = "";
    }

    function OA1_BeforeDocumentOpened() {
        document.OA1.DisableFileCommand(1, true);//wdUIDisalbeOfficeButton
        document.OA1.DisableFileCommand(2, true);//wdUIDisalbeNew
        document.OA1.DisableFileCommand(4, true);//wdUIDisalbeOpen		
        document.OA1.DisableFileCommand(16, true);//wdUIDisalbeSave
        document.OA1.DisableFileCommand(32, true);//wdUIDisalbeSaveAs
        document.OA1.DisableFileCommand(512, true); //wdUIDisalbePrint (Ctrl+P) PES,PCT,CON
        document.OA1.DisableFileCommand(1024, true); //wdUIDisalbePrintQuick
        document.OA1.DisableFileCommand(2048, true); //wdUIDisalbePrintPreview	
    }

    function OA1_DocumentOpened() {
        //You can do the office automation here
        //var objWord = document.OA1.ActiveDocument;
        //objWord.Content.Text = "You can do the office Automation with the Edraw Viewer Component.";
    }

    function OA_DocumentBeforePrint() {
        //document.OA1.DisableStandardCommand(4, true);//cmdTypePrint = 0x00000004,		
        //window.alert("OA_DocumentBeforePrint");
    }

    function OA_WindowBeforeRightClick() {
        //window.alert("OA_WindowBeforeRightClick");
        //document.OA1.DisableStandardCommand(8, true);//cmdTypeRightClick = 0x00000008, the line code will prevent the right click
    }

    function OA_BeforeDocumentSaved() {
        //window.alert("OA_BeforeDocumentSaved");
        //document.OA1.DisableStandardCommand(1, true);//cmdTypeSave  = 0x00000001, the line code will prevent the save
    }
//-->
</script>

<script language="javascript">    
    window.onbeforeunload = function () {
        document.all.OA1.CloseDoc();
    } 
</script>

<script language="javascript" for="OA1" event="NotifyCtrlReady">
<!--
    OA1_NotifyCtrlReady();
//-->
</script>

<script language="javascript" for="OA1" event="DocumentOpened()"> 
    OA1_DocumentOpened();
</script>

<script language="javascript" for="OA1" event="BeforeDocumentOpened()"> 
    OA1_BeforeDocumentOpened();
</script>

<script language="javascript" for="OA1" event="DocumentBeforePrint()"> 
    OA_DocumentBeforePrint();
</script>

<script language="javascript" for="OA1" event="WindowBeforeRightClick()"> 
    OA_WindowBeforeRightClick();
</script>

<script language="javascript" for="OA1" event="DocumentBeforePrint()"> 
    OA_DocumentBeforePrint();
</script>

<body>

    <table border="1" width="100%" height="100%" id="table1" bordercolorlight="#008080" bordercolordark="#008080" cellspacing="1">
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" style="height: 33px">
                <p align="center">
                    <b><font face="Verdana" size="5" color="#008080">Edraw Viewer Component For Word Demo</font></b><p align="center">
                        <b>
                            <font face="Verdana">Please Add the Website in the IE Trust Site List.</font></b>
            </td>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" style="height: 33px"></td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" rowspan="18" width="81%">
                <object classid="clsid:569EB2D6-161D-4AE0-9804-640E724A297A" id="OA1" width="100%" height="100%" codebase="http://www.edrawsoft.com/download/edword.cab#version=8,0,0,733">
                    <param name="Toolbars" value="-1">
                    <param name="LicenseName" value="30daytrial">
                    <param name="LicenseCode" value="EDWD-3333-2222-1111">
                    <param name="BorderColor" value="15647136">
                    <param name="BorderStyle" value="2">
                </object>
                <script language="JavaScript" type="text/javascript" src="NoIEActivate.js"></script>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="OpenFromServer()">
                    Open From Server
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="Readbookmark_Example()">
                    Read Bookmark
                </div>
            </td>
        </tr>
        <%-- <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="OpenFromLocal()">
                    Open From Local
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="OpenFromServer()">
                    Open From Server
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="CreateNew()">
                    Create New
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="ShowHideToolbar()">
                    Show Hide Toolbar
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="DocIsDirty()">
                    Is Modified
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="DisableHotKey()">
                    Disable Hot Key
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="PrintDoc()">
                    Print Doc
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="PrintPreview()">
                    Print Preview
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="ProtectDocOnlyRevisions()">
                    Allow Only Revisions
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="ProtectDocOnlyForm()">
                    Allow Only Form Fields
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="UnProtectDoc()">
                    Cancel Protect
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="DisableDragDrop()">
                    Disable Drag Drop
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="DisableRightClick()">
                    Disable Right Click
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="SaveAs()">
                    Save As
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="SavetoServer()">
                    Save to Server
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="CloseDoc()">
                    Close Doc
                </div>
            </td>
        </tr>
        <tr>
            <td bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" width="17%">
                <div class="Hlink" onclick="VBAProgramming()">
                    Office Automation
                </div>
            </td>
        </tr>--%>
    </table>

    <p>
        Please make sure your computer has installed the Microsoft Office. If you 
find any question or suggest, please feel free to <a href="http://www.ocxt.com/">contact us</a>.
    </p>

</body>

</html>

