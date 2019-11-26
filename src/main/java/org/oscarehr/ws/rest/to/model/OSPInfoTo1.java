/**
 * Copyright (c) 2001-2002. Department of Family Medicine, McMaster University. All Rights Reserved.
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
 * This software was written for the
 * Department of Family Medicine
 * McMaster University
 * Hamilton
 * Ontario, Canada
 */
package org.oscarehr.ws.rest.to.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="Info")
public class OSPInfoTo1 implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String ospName;
	
	private String ospPhone;
	
	private String ospContactName;
	
	private String ospContactEmail;
	
	private String ospUrl;

	public String getOspName() {
		return ospName;
	}

	public void setOspName(String ospName) {
		this.ospName = ospName;
	}

	public String getOspPhone() {
		return ospPhone;
	}

	public void setOspPhone(String ospPhone) {
		this.ospPhone = ospPhone;
	}

	public String getOspContactName() {
		return ospContactName;
	}

	public void setOspContactName(String ospContactName) {
		this.ospContactName = ospContactName;
	}

	public String getOspContactEmail() {
		return ospContactEmail;
	}

	public void setOspContactEmail(String ospContactEmail) {
		this.ospContactEmail = ospContactEmail;
	}

	public String getOspUrl() {
		return ospUrl;
	}

	public void setOspUrl(String ospUrl) {
		this.ospUrl = ospUrl;
	}
	
	
	
}
