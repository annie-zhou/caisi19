/**
 *
 * Copyright (c) 2005-2012. Centre for Research on Inner City Health, St. Michael's Hospital, Toronto. All Rights Reserved.
 * This software is published under the GPL GNU General Public License.
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * This software was written for
 * Centre for Research on Inner City Health, St. Michael's Hospital,
 * Toronto, Ontario, Canada
 */

package org.caisi.wl;

import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * 
 */
@WebService(name = "WaitListService", targetNamespace = "http://caisi.org/wl/")
public interface WaitListService {

	/**
	 * 
	 * @param arg0
	 * @return returns java.util.List<org.caisi.wl.MatchBO>
	 */
	@WebMethod
	@WebResult(targetNamespace = "")
	@RequestWrapper(localName = "listTopMatches", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListTopMatches")
	@ResponseWrapper(localName = "listTopMatchesResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListTopMatchesResponse")
	public List<MatchBO> listTopMatches(
			@WebParam(name = "arg0", targetNamespace = "") TopMatchesQuery arg0);

	/**
	 * 
	 * @param arg0
	 * @return returns org.caisi.wl.VacancyDisplayBO
	 */
	@WebMethod
	@WebResult(targetNamespace = "")
	@RequestWrapper(localName = "getVacancy", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.GetVacancy")
	@ResponseWrapper(localName = "getVacancyResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.GetVacancyResponse")
	public VacancyDisplayBO getVacancy(
			@WebParam(name = "arg0", targetNamespace = "") VacancyQuery arg0);

	/**
	 * 
	 * @param arg0
	 * @return returns java.util.List<org.caisi.wl.VacancyDisplayBO>
	 */
	@WebMethod
	@WebResult(targetNamespace = "")
	@RequestWrapper(localName = "listVacanciesForWaitListProgram", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListVacanciesForWaitListProgram")
	@ResponseWrapper(localName = "listVacanciesForWaitListProgramResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListVacanciesForWaitListProgramResponse")
	public List<VacancyDisplayBO> listVacanciesForWaitListProgram(
			@WebParam(name = "arg0", targetNamespace = "") ProgramQuery arg0);

	/**
	 * 
	 * @param arg0
	 * @return returns java.util.List<org.caisi.wl.VacancyDisplayBO>
	 */
	@WebMethod
	@WebResult(targetNamespace = "")
	@RequestWrapper(localName = "listVacanciesForAgencyProgram", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListVacanciesForAgencyProgram")
	@ResponseWrapper(localName = "listVacanciesForAgencyProgramResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListVacanciesForAgencyProgramResponse")
	public List<VacancyDisplayBO> listVacanciesForAgencyProgram(
			@WebParam(name = "arg0", targetNamespace = "") ProgramQuery arg0);

	/**
	 * 
	 * @param arg0
	 * @return returns java.util.List<org.caisi.wl.ClientWLEntryBO>
	 */
	@WebMethod
	@WebResult(targetNamespace = "")
	@RequestWrapper(localName = "listActiveContactAttempts", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListActiveContactAttempts")
	@ResponseWrapper(localName = "listActiveContactAttemptsResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.ListActiveContactAttemptsResponse")
	public List<ClientWLEntryBO> listActiveContactAttempts(
			@WebParam(name = "arg0", targetNamespace = "") ClientQuery arg0);

	/**
	 * 
	 * @param arg0
	 */
	@WebMethod
	@RequestWrapper(localName = "recordContactAttempt", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordContactAttempt")
	@ResponseWrapper(localName = "recordContactAttemptResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordContactAttemptResponse")
	public void recordContactAttempt(
			@WebParam(name = "arg0", targetNamespace = "") MatchParam arg0);

	/**
	 * 
	 * @param arg0
	 */
	@WebMethod
	@RequestWrapper(localName = "recordClientContact", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordClientContact")
	@ResponseWrapper(localName = "recordClientContactResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordClientContactResponse")
	public void recordClientContact(
			@WebParam(name = "arg0", targetNamespace = "") MatchParam arg0);

	/**
	 * 
	 * @param arg0
	 */
	@WebMethod
	@RequestWrapper(localName = "recordMatchWasForwarded", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordMatchWasForwarded")
	@ResponseWrapper(localName = "recordMatchWasForwardedResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordMatchWasForwardedResponse")
	public void recordMatchWasForwarded(
			@WebParam(name = "arg0", targetNamespace = "") MatchParam arg0);

	/**
	 * 
	 * @param arg0
	 */
	@WebMethod
	@RequestWrapper(localName = "recordReferralOutcome", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordReferralOutcome")
	@ResponseWrapper(localName = "recordReferralOutcomeResponse", targetNamespace = "http://caisi.org/wl/", className = "org.caisi.wl.RecordReferralOutcomeResponse")
	public void recordReferralOutcome(
			@WebParam(name = "arg0", targetNamespace = "") ReferralOutcomeBO arg0);

}
