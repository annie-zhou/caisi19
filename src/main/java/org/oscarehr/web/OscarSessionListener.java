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
package org.oscarehr.web;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.oscarehr.common.dao.CasemgmtNoteLockDao;
import org.oscarehr.common.model.CasemgmtNoteLock;
import org.oscarehr.util.MiscUtils;
import org.oscarehr.util.SpringUtils;

public class OscarSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		String id = se.getSession().getId();
		MiscUtils.getLogger().debug("session is being destroyed - " + id);

		CasemgmtNoteLockDao casemgmtNoteLockDao = SpringUtils.getBean(CasemgmtNoteLockDao.class);
		
		for(CasemgmtNoteLock lock:casemgmtNoteLockDao.findBySession(id)) {
			MiscUtils.getLogger().debug("removing note locks for this session - " + lock);
			
			casemgmtNoteLockDao.remove(lock.getId());
		}
	}

}
