﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OpenLawOffice.WebClient.ViewModels.Notes.NoteViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create Note
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/tinymce/tinymce.min.js"></script>
    <script language="javascript">
        $(document).ready(function () {
            $('#ClearNoticeButton').click(function () {
                $('#NotifyContactIds').val([]);
            });
            tinymce.init({
                selector: "#Body",
                theme: "modern",
                toolbar: "insertfile undo redo | styleselect | bold underline italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
            });
        });
    </script>

    <div id="roadmap">
        <div class="zero">Matter: [<%: Html.ActionLink((string)ViewData["Matter"], "Details", "Matters", new { id = ViewData["MatterId"] }, null) %>]</div>
        <% if (ViewData["Task"] != null)
           { %>
        <div class="one">Task: [<%: Html.ActionLink((string)ViewData["Task"], "Details", "Tasks", new { id = ViewData["TaskId"] }, null)%>]</div>
        <div id="current" class="two">Create Note<a id="pageInfo" class="btn-question" style="padding-left: 15px;">Help</a></div>
        <% }
           else
           { %>           
        <div id="current" class="one">Create Note<a id="pageInfo" class="btn-question" style="padding-left: 15px;">Help</a></div>
        <% } %>
    </div>
    
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <table class="detail_table">
        <tr>
            <td class="display-label">
                Date/Time<span class="required-field" title="Required Field">*</span>
            </td>
            <td class="display-field">
                <%: Html.TextBoxFor(model => model.Timestamp) %>
                <%: Html.ValidationMessageFor(model => model.Timestamp)%>
            </td>
        </tr>
        <tr>
            <td class="display-label">
                Title<span class="required-field" title="Required Field">*</span>
            </td>
            <td class="display-field">
                <%: Html.TextBoxFor(model => model.Title, new { @style = "width: 100%;" })%>
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </td>
        </tr>
        <tr>
            <td class="display-label">
                Send Notice To<br />
                <input type="button" value="Clear Notices" name="ClearNoticeButton" id="ClearNoticeButton" />
            </td>
            <td class="display-field">
                <div style="font-size: 7pt; font-style: italic; padding-bottom: 3px;">Hold ctrl while clicking to select multiple items.</div>
                <%: Html.ListBoxFor(x => x.NotifyContactIds, 
                        new SelectList((IList)ViewData["EmployeeContactList"], "Id", "DisplayName"),
                        new { @size = 5, @style = "width: 100%" }) %>
            </td>
        </tr>
        <tr>
            <td class="display-label">
                Description<span class="required-field" title="Required Field">*</span>
            </td>
            <td class="display-field">
                <%: Html.TextAreaFor(model => model.Body, new { @style = "width: 100%; height: 300px;" })%>
                <%: Html.ValidationMessageFor(model => model.Body)%>
            </td>
        </tr>
    </table>
    <p>
        <input type="submit" value="Save" />
    </p>
    <% } %>
    <div id="pageInfoDialog" title="Help">
        <p>
        <span style="font-weight: bold; text-decoration: underline;">Info:</span>
        Fill in the information on this page to create a new note.  Required fields are indicated with an
        <span style="color: #ee0000;font-size: 12px;cursor:help;" title="Required Field">*</span><br /><br />
        <span style="font-weight: bold; text-decoration: underline;">Usage:</span>
        Fields marked with an <span style="color: #ee0000;font-size: 12px;cursor:help;" title="Required Field">*</span> are required.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuContent" runat="server">
<% if (Request["MatterId"] != null)
    { %>
    <li><%: Html.ActionLink("Matter", "Details", "Matters", new { id = Request["MatterId"] }, null)%></li>
    <li><%: Html.ActionLink("Notes of Matter", "Notes", "Matters", new { id = Request["MatterId"] }, null) %></li>
<%  }
    if (Request["TaskId"] != null)
    { %>
    <li><%: Html.ActionLink("Task", "Details", "Tasks", new { id = Request["TaskId"] }, null)%></li>
    <li><%: Html.ActionLink("Notes of Task", "Notes", "Tasks", new { id = Request["TaskId"] }, null)%></li>
<%  } %>
</asp:Content>