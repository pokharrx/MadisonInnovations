<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="GeneralReport.aspx.cs" Inherits="Sprint1.GeneralReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <style>       
        .home:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .chat:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .add:hover {
            background-color: #dacce6;
            border-top: 2px solid white;
            border-bottom: 2px solid white;
        }
        .tab-content {
            border: 2px solid #dacce6;
            border-radius: 8px;
            box-shadow: 5px 5px 6px 4px rgba(0, 0, 0, 0.2);
            padding: 2%;
            padding-bottom: 5%;
            margin-bottom: 2%;
            background-color: white;
            width: 100%;
        }
    </style>

    <div id="StudentMemberCountInformation">
    <asp:FormView ID="fvStudentMemberCount" 
        DataSourceId="dtasrcStudentMemberCount"
        runat="server" >
        <ItemTemplate>
            <asp:Label ID="lblMemberCount"
                Text="Member Count"
                AssociatedControlID="txtMemberCount"
                runat="server" />
            <asp:Label
                ID="txtMemberCount"
                Text='<%# Eval("MemberCount")%>'
                runat="server" />
            <br />
             <asp:Label ID="lblStudentCount"
                Text="Student Count"
                AssociatedControlID="txtStudentCount"
                runat="server" />
            <asp:Label
                ID="txtStudentCount"
                Text='<%# Eval("StudentCount")%>'
                runat="server" />
            <br /><br />
        </ItemTemplate>
        </asp:FormView>
        </div>

    <div class="row">
            <div id="tablist" class="col-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="v-pills-jobs-tab" data-toggle="pill" href="#v-pills-jobs" role="tab" aria-controls="v-pills-jobs" aria-selected="true">Jobs</a>
                    <a class="nav-link" id="v-pills-members-internships" data-toggle="pill" href="#v-pills-internships" role="tab" aria-controls="v-pills-internships" aria-selected="false">Internships</a>                    
                    <a class="nav-link" id="v-pills-companies-other" data-toggle="pill" href="#v-pills-other" role="tab" aria-controls="v-pills-other" aria-selected="false">Other</a>
                </div>
            </div>
            <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-jobs" role="tabpanel" aria-labelledby="v-pills-jobs-tab">
                        <asp:GridView ID="grdJobInformation" 
                            runat="server" 
                            HorizontalAlign="Justify"  
                            EmptyDataText="No Job Statistics" 
                            AutoGenerateColumns="false"
                            DataKeyNames="CompanyName" 
                            CellPadding="10" 
                            BorderStyle="None"> 
                            <Columns>
                                <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                                <asp:BoundField HeaderText="Number Applied" DataField="Applied" />
                                <asp:BoundField HeaderText="Number Interviewed" DataField="Interviewed" />
                                <asp:BoundField HeaderText="Number of Offers" DataField="Offer" />
                                <asp:BoundField HeaderText="Accepted Offers" DataField="Acceptance" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane fade" id="v-pills-internships" role="tabpanel" aria-labelledby="v-pills-internships-tab">
                        <asp:GridView ID="grdInternshipInformation" 
                            runat="server" 
                            HorizontalAlign="Justify"  
                            EmptyDataText="No Internship Statistics" 
                            AutoGenerateColumns="false"
                            DataKeyNames="CompanyName" 
                            CellPadding="10"
                            BorderStyle="None"> 
                            <Columns>
                                <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                                <asp:BoundField HeaderText="Number Applied" DataField="Applied" />
                                <asp:BoundField HeaderText="Number Interviewed" DataField="Interviewed" />
                                <asp:BoundField HeaderText="Number of Offers" DataField="Offer" />
                                <asp:BoundField HeaderText="Accepted Offers" DataField="Acceptance" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane fade" id="v-pills-other" role="tabpanel" aria-labelledby="v-pills-other-tab">
                        <asp:GridView ID="grdOtherInformation" 
                            runat="server" 
                            HorizontalAlign="Justify"  
                            EmptyDataText="No Other Statistics" 
                            AutoGenerateColumns="false"
                            DataKeyNames="CompanyName" 
                            CellPadding="10"
                            BorderStyle="None"> 
                            <Columns>
                                <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                                <asp:BoundField HeaderText="Number Applied" DataField="Applied" />
                                <asp:BoundField HeaderText="Number Interviewed" DataField="Interviewed" />
                                <asp:BoundField HeaderText="Number of Offers" DataField="Offer" />
                                <asp:BoundField HeaderText="Accepted Offers" DataField="Acceptance" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%-- Data Sources for the gridviews --%>
    <asp:SqlDataSource ID="dtasrcStudentMemberCount" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT COUNT(Member.MemberID) AS MemberCount, COUNT(Student.StudentID) AS StudentCount FROM  Member FULL OUTER JOIN StudentMentor ON Member.MemberID = StudentMentor.MemberID  FULL OUTER JOIN Student ON StudentMentor.StudentID = Student.StudentID">
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="dtasrcJobInformation" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT c.CompanyName, (SELECT COUNT(ja.ApplicationStatus) FROM JobApplication as ja WHERE ApplicationStatus ='yes') AS Applied, (SELECT COUNT(ja.InterviewStatus) FROM JobApplication as ja WHERE ja.InterviewStatus ='yes') AS Interviewed, (SELECT COUNT(ja.OfferStatus) FROM JobApplication as ja WHERE ja.OfferStatus='yes') AS Offer, (SELECT COUNT(ja.AcceptedStatus) FROM JobApplication as ja WHERE ja.AcceptedStatus='yes') AS Acceptance
                        FROM  Job as j INNER JOIN
                        JobApplication as ja ON j.JobID = ja.JobID INNER JOIN
                         CorporateSponsor as cs ON j.ContactID = cs.ContactID INNER JOIN
                         Company as c ON cs.CompanyID = c.CompanyID
                         GROUP BY c.CompanyName;  ">
    </asp:SqlDataSource>

       <asp:SqlDataSource ID="dtasrcInternshipInformation" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT c.CompanyName, (SELECT COUNT(ja.ApplicationStatus) FROM InternshipApplication as ja WHERE ApplicationStatus ='yes') AS Applied, (SELECT COUNT(ja.InterviewStatus) FROM InternshipApplication as ja WHERE ja.InterviewStatus ='yes') AS Interviewed, (SELECT COUNT(ja.OfferStatus) FROM InternshipApplication as ja WHERE ja.OfferStatus='yes') AS Offer, (SELECT COUNT(ja.AcceptedStatus) FROM InternshipApplication as ja WHERE ja.AcceptedStatus='yes') AS Acceptance
                       FROM  Internship as j INNER JOIN
                       InternshipApplication as ja ON j.InternshipID = ja.InternshipID INNER JOIN
                       CorporateSponsor as cs ON j.ContactID = cs.ContactID INNER JOIN
                       Company as c ON cs.CompanyID = c.CompanyID
                       GROUP BY c.CompanyName;  ">
    </asp:SqlDataSource>

       <asp:SqlDataSource ID="dtasrcOtherInformation" runat="server"
        ConnectionString ="<%$ ConnectionStrings:SDB %>"
        SelectCommand="SELECT c.CompanyName, (SELECT COUNT(ja.ApplicationStatus) FROM OtherApplication as ja WHERE ApplicationStatus ='yes') AS Applied, (SELECT COUNT(ja.InterviewStatus) FROM OtherApplication as ja WHERE ja.InterviewStatus ='yes') AS Interviewed, (SELECT COUNT(ja.OfferStatus) FROM OtherApplication as ja WHERE ja.OfferStatus='yes') AS Offer, (SELECT COUNT(ja.AcceptedStatus) FROM OtherApplication as ja WHERE ja.AcceptedStatus='yes') AS Acceptance
                    FROM  Other as j INNER JOIN
                    OtherApplication as ja ON j.OtherID = ja.OtherID INNER JOIN
                     CorporateSponsor as cs ON j.ContactID = cs.ContactID INNER JOIN
                    Company as c ON cs.CompanyID = c.CompanyID
                    GROUP BY c.CompanyName; ">
    </asp:SqlDataSource>

</asp:Content>
