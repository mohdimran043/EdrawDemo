<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyForm.aspx.cs" Inherits="EdrawWordDemo.SurveyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            direction: rtl !important;
        }

        .tbl-manager-survey-header, .tbl-manager-survey-user-detail {
            width: 100%;
        }

        body {
            color: #6a6c6f;
            background-color: #f1f3f6;
            margin-top: 30px;
        }

        .container {
            max-width: 960px;
        }

        .panel-default > .panel-heading {
            color: #333;
            background-color: #fff;
            border-color: #e4e5e7;
            padding: 0;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

            .panel-default > .panel-heading a {
                display: block;
                padding: 10px 15px;
            }

                .panel-default > .panel-heading a:after {
                    content: "";
                    position: relative;
                    top: 1px;
                    display: inline-block;
                    font-family: 'Glyphicons Halflings';
                    font-style: normal;
                    font-weight: 400;
                    line-height: 1;
                    -webkit-font-smoothing: antialiased;
                    -moz-osx-font-smoothing: grayscale;
                    float: left;
                    transition: transform .25s linear;
                    -webkit-transition: -webkit-transform .25s linear;
                }

                .panel-default > .panel-heading a[aria-expanded="true"] {
                    background-color: #eee;
                }

                    .panel-default > .panel-heading a[aria-expanded="true"]:after {
                        content: "\2212";
                        -webkit-transform: rotate(180deg);
                        transform: rotate(180deg);
                    }

                .panel-default > .panel-heading a[aria-expanded="false"]:after {
                    content: "\002b";
                    -webkit-transform: rotate(90deg);
                    transform: rotate(90deg);
                }

        .accordion-option {
            width: 100%;
            float: left;
            clear: both;
            margin: 15px 0;
        }

            .accordion-option .title {
                font-size: 20px;
                font-weight: bold;
                float: left;
                padding: 0;
                margin: 0;
            }

            .accordion-option .toggle-accordion {
                float: right;
                font-size: 16px;
                color: #6a6c6f;
            }

                .accordion-option .toggle-accordion:before {
                    content: "Expand All";
                }

                .accordion-option .toggle-accordion.active:before {
                    content: "Collapse All";
                }
    </style>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Content/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            //$("#accordion").accordion({
            //    collapsible: true,
            //    heightStyle: "content"
            //});
            $(".toggle-accordion").on("click", function () {
                var accordionId = $(this).attr("accordion-id"),
                    numPanelOpen = $(accordionId + ' .collapse.in').length;

                $(this).toggleClass("active");

                if (numPanelOpen == 0) {
                    openAllPanels(accordionId);
                } else {
                    closeAllPanels(accordionId);
                }
            })

            openAllPanels = function (aId) {
                console.log("setAllPanelOpen");
                $(aId + ' .panel-collapse:not(".in")').collapse('show');
            }
            closeAllPanels = function (aId) {
                console.log("setAllPanelclose");
                $(aId + ' .panel-collapse.in').collapse('hide');
            }

            $('.tbl-manager-info').on('keydown', 'input', function (e) {
                var keyCode = e.keyCode;
                if (keyCode !== 9) return;
                var $this = $(this),
                    $lastTr = $('tr:last', $('.tbl-manager-info')),
                    $lastTd = $('td:last', $lastTr);
                if (($(e.target).closest('td')).is($lastTd)) {
                    $lastTr.after($lastTr.clone());
                    $('tr:last', $('.tbl-manager-info')).find("input:text").val("");
                }

            });
        });
        var _LoadSurveyByID = function () { };
        var _SaveSurvery = function () { };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-horizontal">
                <div class="accordion-option">
                    <h3 class="title">MOI Survey Form</h3>
                    <a href="javascript:void(0)" class="toggle-accordion active" accordion-id="#accordion"></a>
                </div>
                <div class="clearfix"></div>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Collapsible Group Survey Heading
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-10">
                                        WELCOME TO MANAGER SURVEY
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">Collapsible Group Survey User Info
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="row">

                                    <table class="tbl-manager-survey-user-detail">
                                        <tr>
                                            <td>
                                                <span class="tbl-manager-survey-user-detail-td-text">NAME
                                                </span>
                                            </td>
                                            <td>

                                                <span class="tbl-manager-survey-user-detail-td-value tbl-manager-survey-user-detail-td-text-name">---
                                                </span>
                                            </td>

                                            <td>
                                                <span class="tbl-manager-survey-user-detail-td-text">Rank
                                                </span>
                                            </td>
                                            <td>

                                                <span class="tbl-manager-survey-user-detail-td-text-rank">--
                                                </span>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">Collapsible Group  Survey table
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <div class="row">
                                    <table class="table table-striped table-bordered tbl-manager-info">
                                        <thead>
                                            <tr>
                                                <th>Description1</th>
                                                <th>Description2</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr>
                                                <td>
                                                    <input type="text" class="form-control" placeholder="Enter Description1" name="txtEvent" />
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder="Enter Description2" name="txtEvent" />
                                                </td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row tbl-manager-survey-submit-buttons">
                    <div class="col-md-5">
                        <button class="btn btn-primary btn-manager-survey-submit">SUBMIT</button>
                    </div>
                    <div class="col-md-5">
                        <button class="btn btn-manager-survey-close">SAVE</button>
                    </div>
                </div>
            </div>
        </div>


    </form>
</body>
</html>
