<%--

    Copyright (c) 2001-2002. Department of Family Medicine, McMaster University. All Rights Reserved.
    This software is published under the GPL GNU General Public License.
    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

    This software was written for the
    Department of Family Medicine
    McMaster University
    Hamilton
    Ontario, Canada

--%>

<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="org.oscarehr.casemgmt.web.PrescriptDrug"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/oscar-tag.tld" prefix="oscar" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/indivo-tag.tld" prefix="indivo" %>
<%@ page import="oscar.oscarRx.data.*,oscar.oscarProvider.data.ProviderMyOscarIdData,oscar.oscarDemographic.data.DemographicData,oscar.OscarProperties,oscar.log.*"%>
<%@page import="org.oscarehr.casemgmt.service.CaseManagementManager,org.springframework.web.context.WebApplicationContext,
		org.springframework.web.context.support.WebApplicationContextUtils,org.oscarehr.casemgmt.model.CaseManagementNoteLink,org.oscarehr.casemgmt.model.CaseManagementNote"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Enumeration"%>
<%@page import="org.oscarehr.util.SpringUtils"%>
<%@page import="org.oscarehr.util.SessionConstants"%>
<%@page import="java.util.List,oscar.util.StringUtils"%>
<%@page import="org.oscarehr.PMmodule.caisi_integrator.CaisiIntegratorManager"%>
<%@page import="org.oscarehr.util.LoggedInInfo,org.oscarehr.common.dao.DrugReasonDao,org.oscarehr.common.model.DrugReason"%>
<%@page import="java.util.ArrayList,oscar.util.*,java.util.*,org.oscarehr.common.model.Drug,org.oscarehr.common.dao.*"%>
<%@page import="org.oscarehr.managers.DrugDispensingManager" %>
<%@page import="org.oscarehr.managers.CodingSystemManager" %>
<bean:define id="patient" type="oscar.oscarRx.data.RxPatientData.Patient" name="Patient" />
<logic:notPresent name="RxSessionBean" scope="session">
    <logic:redirect href="error.html" />
</logic:notPresent>
<logic:present name="RxSessionBean" scope="session">
    <bean:define id="bean" type="oscar.oscarRx.pageUtil.RxSessionBean"
                 name="RxSessionBean" scope="session" />
    <logic:equal name="bean" property="valid" value="false">
        <logic:redirect href="error.html" />
    </logic:equal>
</logic:present>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<%
    String roleName$ = (String)session.getAttribute("userrole") + "," + (String) session.getAttribute("user");
    boolean authed=true;
%>
<security:oscarSec roleName="<%=roleName$%>" objectName="_rx" rights="r" reverse="<%=true%>">
	<%authed=false; %>
	<%response.sendRedirect("../securityError.jsp?type=_rx");%>
</security:oscarSec>
<%
	if(!authed) {
		return;
	}
%>

<%
	LoggedInInfo loggedInInfo=LoggedInInfo.getLoggedInInfoFromSession(request);
	com.quatro.service.security.SecurityManager securityManager = new com.quatro.service.security.SecurityManager();
	oscar.oscarRx.pageUtil.RxSessionBean bean = (oscar.oscarRx.pageUtil.RxSessionBean) pageContext.findAttribute("bean");
	boolean showall = false;
	if (request.getParameter("show") != null) {
	    if (request.getParameter("show").equals("all")) {
	        showall = true;
	    }
	}
	
	CodingSystemManager codingSystemManager = SpringUtils.getBean(CodingSystemManager.class);
	
	boolean integratorEnabled = loggedInInfo.getCurrentFacility().isIntegratorEnabled();
	String annotation_display = org.oscarehr.casemgmt.model.CaseManagementNoteLink.DISP_PRESCRIP;
	String heading = request.getParameter("heading");
	
if (heading != null){
%>
<h4 style="margin-bottom:1px;margin-top:3px;"><%=heading%></h4>
<%}%>
<div class="drugProfileText" style="">
    <table width="100%" cellpadding="3" border="0" class="sortable" id="Drug_table<%=heading%>">
    <%
        // check custom name and brand name
        String rxName = request.getParameter("rxName");
        if (OscarProperties.getInstance().isPropertyActive("enable_rx_custom_methodone_suboxone") && rxName != null && (rxName.toLowerCase().contains("methadone") 
        		|| rxName.toLowerCase().contains("suboxone")
        		|| rxName.toLowerCase().contains("buprenorphine"))) {
        %>
        <tr>
        	<th align="left"><b>Start Date</b></th>
            <th align="left"><b><bean:message key="WriteScript.endDate"/></b></th>
            <th align="left"><b><bean:message key="WriteScript.carryGiving"/></b></th>
            <th align="left"><b><bean:message key="WriteScript.carryLevel"/></b></th>
            <th align="left"><b>Rx</b></th>
            
        </tr>
        <%
        CaseManagementManager caseManagementManager = (CaseManagementManager) SpringUtils.getBean("caseManagementManager");
        List<Drug> prescriptDrugs = caseManagementManager.getCustomPrescriptions(patient.getDemographicNo(), rxName);
       	Collections.sort(prescriptDrugs, new oscar.oscarRx.util.ShowAllSorter());
		for (int x=0;x<prescriptDrugs.size();x++) {
			Drug prescriptDrug = prescriptDrugs.get(x);
			String rx = prescriptDrug.getCustomName();
			if (rx == null || rx.isEmpty()) {
				//rx = prescriptDrug.getBrandName();
				rx = prescriptDrug.getSpecial();
			}
			String dosage = prescriptDrug.getDosage();
			if (dosage == null) {
				dosage = "";
			}
						
			int carryGaving = 0;
			String carryLevel = "";
			if(prescriptDrug.getComment() !=null ) {
				String arr[] = prescriptDrug.getComment().split(";");
				if (arr.length > 1 && !"NONE".equalsIgnoreCase(arr[1])) {
					for (String c:arr[1].split(",")) {
						if (!c.trim().isEmpty() && !"CARRY".equalsIgnoreCase(c)) {
							carryGaving++;
						}
					}
				}
				
				if (arr.length > 2 && arr[2] != null && !arr[2].isEmpty()) {
					carryLevel = arr[2];
				}
			}
        %>
        <tr>
        	<td valign="top"><%=oscar.util.UtilDateUtilities.DateToString(prescriptDrug.getRxDate())%></td>
        	<td valign="top"><%=oscar.util.UtilDateUtilities.DateToString(prescriptDrug.getEndDate())%></td>
        	<td><%=carryGaving %></td>
        	<td><%=carryLevel %></td>
        	<td><%=rx %></td>
        	
        </tr>
        <%} %>
        
       <% } else { %>
       
        <tr>
        	<th align="left"><b>Entered Date</b></th>
            <th align="left"><b><bean:message key="SearchDrug.msgRxDate"/></b></th>
            <%if (OscarProperties.getInstance().isPropertyActive("enable_rx_custom_methodone_suboxone")) {%>
            <th align="left"><b><bean:message key="WriteScript.endDate"/></b></th>
            <th align="left"><b><bean:message key="WriteScript.carryGiving"/></b></th>
            <th align="left"><b><bean:message key="WriteScript.carryLevel"/></b></th>
            <%} %>
            <th align="left"><b>Days to Exp</b></th>
            <th align="left"><b>LT Med</b></th>
            <th align="left"><b><bean:message key="SearchDrug.msgPrescription"/></b></th>
			<%if(securityManager.hasWriteAccess("_rx",roleName$,true)) {%>
				<%if("true".equals(OscarProperties.getInstance().getProperty("rx.allow_rerx","true"))) { %>
            <th align="center" width="35px"><b><bean:message key="SearchDrug.msgReprescribe"/></b></th>
            	<%} %>
            	<%if(!OscarProperties.getInstance().getProperty("rx.delete_drug.hide","false").equals("true")) {%>
            	<th align="center" width="35px"><b><bean:message key="SearchDrug.msgDelete"/></b></th>
            <% 	}	 
			}            
            %>
            <th align="center" width="35px"><b><bean:message key="SearchDrug.msgDiscontinue"/></b></th>		
			<th align="center" width="35px" title="<bean:message key="SearchDrug.msgReason_help"/>"><b><bean:message key="SearchDrug.msgReason"/></b></th>    
            <th align="center" width="35px"><b><bean:message key="SearchDrug.msgPastMed"/></b></th>
            <%if(securityManager.hasWriteAccess("_rx",roleName$,true)) {%>
            	<th align="center" width="15px">&nbsp;</th>
            <% } %>
            <th align="center"><bean:message key="SearchDrug.msgLocationPrescribed"/></th>
            <th align="center" title="<bean:message key="SearchDrug.msgHideCPP_help"/>"><bean:message key="SearchDrug.msgHideCPP"/></th>
            <%if(OscarProperties.getInstance().getProperty("rx.enable_internal_dispensing","false").equals("true")) {%>
             <th align="center"><bean:message key="SearchDrug.msgDispense"/></th>
             <%} %>
             <th align="center"></th>
        </tr>

        <%
	        List<Drug> prescriptDrugs = null;
            CaseManagementManager caseManagementManager = (CaseManagementManager) SpringUtils.getBean("caseManagementManager");

            if(showall) {
            	prescriptDrugs = caseManagementManager.getPrescriptions(loggedInInfo, patient.getDemographicNo(), showall);
            	//Collections.sort(prescriptDrugs,new oscar.oscarRx.util.ShowAllSorter());
            }
            else {
                prescriptDrugs = caseManagementManager.getCurrentPrescriptions(patient.getDemographicNo());
            }

            DrugReasonDao drugReasonDao  = (DrugReasonDao) SpringUtils.getBean("drugReasonDao");
			
            DrugDispensingManager drugDispensingManager = SpringUtils.getBean(DrugDispensingManager.class);
            List<String> reRxDrugList=bean.getReRxDrugIdList();


            long now = System.currentTimeMillis();
            long month = 1000L * 60L * 60L * 24L * 30L;
			for (int x=0;x<prescriptDrugs.size();x++) {
				Drug prescriptDrug = prescriptDrugs.get(x);
				boolean isPrevAnnotation=false;
                String styleColor = "";
                //test for previous note
                HttpSession se = request.getSession();
                Integer tableName = caseManagementManager.getTableNameByDisplay(annotation_display);
                
                CaseManagementNoteLink cml = null;
                CaseManagementNote p_cmn = null;

                if (prescriptDrug.getRemoteFacilityId()!=null)
                {
                	cml = caseManagementManager.getLatestLinkByTableId(tableName, Long.parseLong(prescriptDrug.getId().toString()));
                }
                
                if (cml!=null) {p_cmn = caseManagementManager.getNote(cml.getNoteId().toString());}
                if (p_cmn!=null){isPrevAnnotation=true;}

                if (request.getParameter("status") != null) { //TODO: Redo this in a better way
                    String stat = request.getParameter("status");
                    if (stat!=null && stat.equals("active") && !prescriptDrug.isLongTerm() && !prescriptDrug.isCurrent()  ) {
                        continue;
                    } else if( stat!=null && stat.equals("active") && prescriptDrug.isLongTerm() && prescriptDrug.getPastMed() ) {
                    	continue;
                    } else if (stat!=null && stat.equals("inactive") && prescriptDrug.isCurrent()) {
                        continue;
                    }
                }
                if (request.getParameter("longTermOnly") != null && request.getParameter("longTermOnly").equals("true")){
                    if (!prescriptDrug.isLongTerm()){
                      continue;
                    }
                }

                if (request.getParameter("longTermOnly") != null && request.getParameter("longTermOnly").equals("acute")){
                    if (prescriptDrug.isLongTerm()){
                      continue;
                    }
                }
                if(request.getParameter("drugLocation")!=null&&request.getParameter("drugLocation").equals("external")){
                    if(!prescriptDrug.isExternal())
                        continue;
                }
//add all long term med drugIds to an array.
                styleColor = getClassColour( prescriptDrug, now, month);
                String specialText=prescriptDrug.getSpecial();
                specialText= specialText == null ? "" : specialText.replace("\n"," ");
                Integer prescriptIdInt=prescriptDrug.getId();
                String bn=prescriptDrug.getBrandName();
                
                boolean startDateUnknown = prescriptDrug.getStartDateUnknown();
                
                String rx = prescriptDrug.getCustomName();
    			if (rx == null || rx.isEmpty()) {
    				rx = prescriptDrug.getBrandName();
    			}
                String carryLevel = "", carryGaving = "N/A";
                if (OscarProperties.getInstance().isPropertyActive("enable_rx_custom_methodone_suboxone") && rx != null && (rx.toLowerCase().contains("methadone") 
                		|| rx.toLowerCase().contains("suboxone")
                		|| rx.toLowerCase().contains("buprenorphine"))) {
                	if(prescriptDrug.getComment()!=null) {
                		int carryCount = 0;
                		String arr[] = prescriptDrug.getComment().split(";");
            			if (arr.length > 1 && !"NONE".equalsIgnoreCase(arr[1])) {
            				for (String c:arr[1].split(",")) {
            					if (!c.trim().isEmpty() && !"CARRY".equalsIgnoreCase(c)) {
            						carryCount++;
            					}
            				}
            			}
            			carryGaving = Integer.toString(carryCount);
            			if (arr.length > 2 && arr[2] != null && !arr[2].isEmpty()) {
            				carryLevel = arr[2];
            			}
                	}
                }
        %>
        <tr>
        <td valign="top"><a id="createDate_<%=prescriptIdInt%>"   <%=styleColor%> href="StaticScript2.jsp?regionalIdentifier=<%=prescriptDrug.getRegionalIdentifier()%>&amp;cn=<%=response.encodeURL(prescriptDrug.getCustomName())%>&amp;bn=<%=response.encodeURL(bn)%>&amp;atc=<%=prescriptDrug.getAtc()%>"><%=oscar.util.UtilDateUtilities.DateToString(prescriptDrug.getCreateDate())%></a></td>
            <td valign="top">
            	<% if(startDateUnknown) { %>
            		
            	<% } else { %>
            		<a id="rxDate_<%=prescriptIdInt%>"   <%=styleColor%> href="StaticScript2.jsp?regionalIdentifier=<%=prescriptDrug.getRegionalIdentifier()%>&amp;cn=<%=response.encodeURL(prescriptDrug.getCustomName())%>&amp;bn=<%=response.encodeURL(bn)%>"><%=oscar.util.UtilDateUtilities.DateToString(prescriptDrug.getRxDate())%></a>
            	<% } %>
            </td>
            <%if (OscarProperties.getInstance().isPropertyActive("enable_rx_custom_methodone_suboxone")) { %>
            <td valign="top"><%=oscar.util.UtilDateUtilities.DateToString(prescriptDrug.getEndDate())%></td>
            <td valign="top"><%=carryGaving %></td>
        	<td valign="top"><%=carryLevel %></td>
        	<%} %>
        	<td valign="top">
            	<% if(startDateUnknown) { %>
            		
            	<% } else { %>
            		<%=prescriptDrug.daysToExpire()%>
            	<% } %>
            </td>
            <td valign="top">
            	<%
            		if(prescriptDrug.isLongTerm())
            		{
            		%>
            			*
            		<%
            		}
            		else
            		{
            			if (prescriptDrug.getRemoteFacilityId()==null)
            			{
            				%>
							<%
								if(securityManager.hasWriteAccess("_rx",roleName$,true)) {            		
							%>
		            			<a id="notLongTermDrug_<%=prescriptIdInt%>" title="<bean:message key='oscarRx.Prescription.changeDrugLongTerm'/>" onclick="changeLt('<%=prescriptIdInt%>');" href="javascript:void(0);">
		            			L
		            			</a>
							<% } else { %>
            					<span style="color:blue">L</span>
            				<% } %>

            				<%
            			}
            			else
            			{
		            		%>
		            		L
		            		<%
            			}
           			}
           			%>
            </td>
			<%
			//display comment as tooltip if not null - simply using the TITLE attr
			String xComment=prescriptDrug.getComment();
			String tComment="";
			if(xComment!=null ){
				tComment="TITLE='"+xComment+" '";
			}
			
			%>
            <td valign="top"><a id="prescrip_<%=prescriptIdInt%>" <%=styleColor%> href="StaticScript2.jsp?regionalIdentifier=<%=prescriptDrug.getRegionalIdentifier()%>&amp;cn=<%=response.encodeURL(prescriptDrug.getCustomName())%>&amp;bn=<%=response.encodeURL(bn)%>&amp;atc=<%=prescriptDrug.getAtc()%>"   <%=tComment%>   ><%=RxPrescriptionData.getFullOutLine(prescriptDrug.getSpecial()).replaceAll(";", " ")%></a></td>
			<%            			
	           	if(securityManager.hasWriteAccess("_rx",roleName$,true)) {            		
           	%>
           	<%if("true".equals(OscarProperties.getInstance().getProperty("rx.allow_rerx","true"))) { %>
            <td width="20px" align="center" valign="top">
            	
                <%if (prescriptDrug.getRemoteFacilityName() == null) {%>
                <input id="reRxCheckBox_<%=prescriptIdInt%>" type=CHECKBOX onclick="updateReRxDrugId(this.id)" <%if(reRxDrugList.contains(prescriptIdInt.toString())){%>checked<%}%> name="checkBox_<%=prescriptIdInt%>">
                <a name="rePrescribe" style="vertical-align:top" id="reRx_<%=prescriptIdInt%>" <%=styleColor%> href="javascript:void(0)" onclick="represcribe(this, <%=prescriptIdInt%>)">ReRx</a>
                <%} else {%>
                <form action="<%=request.getContextPath()%>/oscarRx/searchDrug.do" method="post">
                    <input type="hidden" name="demographicNo" value="<%=patient.getDemographicNo()%>" />
                    <input type="hidden" name="searchString" value="<%=getName(prescriptDrug)%>" />
                    <input type="submit" class="ControlPushButton" value="Search to Re-prescribe" />
                </form>
                <%} %>
            </td>
            <% } %>
			<%if(!OscarProperties.getInstance().getProperty("rx.delete_drug.hide","false").equals("true")) { %>
            <td width="20px" align="center" valign="top">
                <%if (prescriptDrug.getRemoteFacilityName() == null) {%>
                <security:oscarSec roleName="<%=roleName$%>" objectName="_rx" rights="w">
                   <a id="del_<%=prescriptIdInt%>" name="delete" <%=styleColor%> href="javascript:void(0);" onclick="Delete2(this);">Del</a>
                </security:oscarSec>
                <%}%>
            </td>
            <td width="20px" align="center" valign="top">
                <%if (prescriptDrug.getRemoteFacilityName() == null) {%>
                	<security:oscarSec roleName="<%=roleName$%>" objectName="_rx" rights="w">
                   <a id="delA_<%=prescriptIdInt%>" name="deleteAll" <%=styleColor%> href="javascript:void(0);" onclick="Delete2(this);">DelAll</a>
                   </security:oscarSec>
                <%}%>
            </td>

			<% } 
	         }
			%>
            <td width="20px" align="center" valign="top">
                <%if(!prescriptDrug.isDiscontinued())
                {
               	 if (prescriptDrug.getRemoteFacilityId()==null)
               	 {
               		
					if(securityManager.hasWriteAccess("_rx",roleName$,true)) {            		
				
                %>
                	<a id="discont_<%=prescriptIdInt%>" href="javascript:void(0);" onclick="Discontinue(event,this);" <%=styleColor%> >Discon</a>                
                <% }
               	 }
                }else{%>
                  <%=prescriptDrug.getArchivedReason()%>
                <%}%>
            </td>
  <%-- DRUG REASON --%>          
            <td style="vertical-align:top;">
            	<% 	
            		List<DrugReason> drugReasons  = drugReasonDao.getReasonsForDrugID(prescriptDrug.getId(),true);            		            					        	
			
            		if (prescriptDrug.getRemoteFacilityId()==null && securityManager.hasWriteAccess("_rx",roleName$,true) )
            		{
            			%>
			           	 	<a href="javascript:void(0);"  onclick="popupRxReasonWindow(<%=patient.getDemographicNo()%>,<%=prescriptIdInt%>);"  title="<%=displayDrugReason(codingSystemManager,drugReasons,true) %>">
            			<%
            		}
            	%>
            	<%=StringUtils.maxLenString(displayDrugReason(codingSystemManager,drugReasons,false), 4, 3, StringUtils.ELLIPSIS)%>
				<%
		      		if (prescriptDrug.getRemoteFacilityId()==null  && securityManager.hasWriteAccess("_rx",roleName$,true))
		      		{
		      			%>
			            	</a>
            			<%
            		}
				%>
            </td>
  <%-- END DRUG REASON --%> 		
            <%
            Boolean past_med = prescriptDrug.getPastMed();
            if( past_med == null ) {
            	past_med = false;
            } %>
            <td align="center" valign="top"><%=(past_med)?"yes":"no" %></td>

			<%if(securityManager.hasWriteAccess("_rx",roleName$,true)) {%>
            <td width="10px" align="center" valign="top">
            	<% 	
            		if (prescriptDrug.getRemoteFacilityId()==null)
            		{
            			%>
		                <a href="javascript:void(0);" title="Annotation" onclick="window.open('../annotation/annotation.jsp?display=<%=annotation_display%>&amp;table_id=<%=prescriptIdInt%>&amp;demo=<%=bean.getDemographicNo()%>&amp;drugSpecial=<%=StringEscapeUtils.escapeJavaScript(specialText)%>','anwin','width=400,height=500');">
		                    <%if(!isPrevAnnotation){%> <img src="../images/notes.gif" alt="rxAnnotation" height="16" width="13" border="0"><%} else{%><img src="../images/filledNotes.gif" height="16" width="13" alt="rxFilledNotes" border="0"> <%}%></a>
            			<%
            		}
            	%>
            </td>
            <% } %>
            
            <td width="10px" align="center" valign="top">
                <%
                if (prescriptDrug.getRemoteFacilityName() != null){ %>
                    <span class="external"><%=prescriptDrug.getRemoteFacilityName()%></span>
                <%}else if(  prescriptDrug.getOutsideProviderName() !=null && !prescriptDrug.getOutsideProviderName().equals("")  ){%>
                    <span class="external"><%=prescriptDrug.getOutsideProviderName()%></span>
                <%}else{%>
                    local
                <%}%>


            </td>

			<td align="center" valign="top">
				<%
					boolean hideCpp = prescriptDrug.getHideFromCpp();
					String checked="";
					if(hideCpp) {
						checked="checked=\"checked\"";
					}
				%>
				<input type="checkbox" id="hidecpp_<%=prescriptIdInt%>" <%=checked%>/>
			</td>
			
			<%if(OscarProperties.getInstance().getProperty("rx.enable_internal_dispensing","false").equals("true")) {%>
			<td align="center" valign="top">
				<%
					if(prescriptDrug.getDispenseInternal() != null && prescriptDrug.getDispenseInternal() == true ) {
						if(securityManager.hasWriteAccess("_dispensing",roleName$,true)) {	
							String dispensingStatus = drugDispensingManager.getStatus(prescriptDrug.getId());
				               
				%>
					<a href="javascript:void(0)" onclick="javascript:popupWindow(720,700,'<%=request.getContextPath()%>/oscarRx/Dispense.do?method=view&id=<%=prescriptDrug.getId()%>','Dispense<%=prescriptIdInt %>'); return false;">Dispense (<%=dispensingStatus%>)</a>
				<% 
					} }
				%>
			</td>
			<% } %>
			
			<td nowrap="nowrap" align="center" valign="top">
				<%if(!(prescriptDrugs.get(prescriptDrugs.size()-1) == prescriptDrug)) {%>
				<img border="0" src="<%=request.getContextPath()%>/images/icon_down_sort_arrow.png" onclick="moveDrugDown(<%=prescriptDrug.getId() %>,<%=prescriptDrugs.get(x+1).getId() %>,<%=prescriptDrug.getDemographicId()%>);return false;"/>
				<% } %>
				<%if(!(prescriptDrugs.get(0) == prescriptDrug)) {%>
				<img border="0" src="<%=request.getContextPath()%>/images/icon_up_sort_arrow.png" onclick="moveDrugUp(<%=prescriptDrug.getId() %>,<%=prescriptDrugs.get(x-1).getId() %>,<%=prescriptDrug.getDemographicId()%>);return false;"/>
				<%} %>
			</td>
        </tr>
        <script>
Event.observe('hidecpp_<%=prescriptIdInt%>', 'change', function(event) {
	var val = $('hidecpp_<%=prescriptIdInt%>').checked;	
	new Ajax.Request('<c:out value="${ctx}"/>/oscarRx/hideCpp.do?method=update&prescriptId=<%=prescriptIdInt%>&value='+val, {
		  method: 'get',
		  onSuccess: function(transport) {		   
		  }
		});

});

</script>
        <%}%>
    </table>
<%} %>
</div>
        <br>

        
        <script type="text/javascript">
sortables_init();
            </script>
<%!

String getName(Drug prescriptDrug){
    String searchString = prescriptDrug.getBrandName();
    if (searchString == null) {
        searchString = prescriptDrug.getCustomName();
    }
    if (searchString == null) {
        searchString = prescriptDrug.getRegionalIdentifier();
    }
    if (searchString == null) {
        searchString = prescriptDrug.getSpecial();
    }
    return searchString;
}

    String getClassColour(Drug drug, long referenceTime, long durationToSoon){
        StringBuilder sb = new StringBuilder("class=\"");

        if (!drug.isLongTerm() && (drug.isCurrent() && drug.getEndDate() != null && (drug.getEndDate().getTime() - referenceTime <= durationToSoon))) {
            sb.append("expireInReference ");
        }

        if ((drug.isCurrent() && !drug.isArchived()) || drug.isLongTerm()) {
            sb.append("currentDrug ");
        }

        if (drug.isArchived()) {
            sb.append("archivedDrug ");
        }

        if(!drug.isLongTerm() && !drug.isCurrent()) {
            sb.append("expiredDrug ");
        }

        if(drug.isLongTerm()){
            sb.append("longTermMed ");
        }

        if(drug.isDiscontinued()){
            sb.append("discontinued ");
        }

        if(drug.isDeleted()){
                sb.append("deleted ");

        }
        
        if(drug.getOutsideProviderName() !=null && !drug.getOutsideProviderName().equals("")  ) {
        	sb = new StringBuilder("class=\"");
        	sb.append("external ");
        }
        if (drug.getRemoteFacilityName() != null){
        	sb = new StringBuilder("class=\"");
        	sb.append("external ");
        }
        String retval = sb.toString();

        if(retval.equals("class=\"")){
            return "";
        }

        return retval.substring(0,retval.length())+"\"";

    }

%><%!

String displayDrugReason(CodingSystemManager codingSystemManager, List<DrugReason> drugReasons,boolean title){
	StringBuilder sb = new StringBuilder();
	boolean multiLoop = false;
	
	for(DrugReason drugReason:drugReasons){
		if(multiLoop){
			sb.append(", ");
		}
		String codeDescr = codingSystemManager.getCodeDescription( drugReason.getCodingSystem(), drugReason.getCode() );
		if(codeDescr != null) {
			sb.append(StringEscapeUtils.escapeHtml(codeDescr));
		} else {
			sb.append( drugReason.getCode() );
		}
		multiLoop = true;
	}
	if(sb.toString().equals("")){
		if(title) {
			return "No diseases are associated with this medication";
		}
		return "+";
	}
	
	return sb.toString();
}

%>
