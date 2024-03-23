package com.myedumyselect.admin.openapi.data.service;

public interface DataService {

	public int listTotalCount() throws Exception;

	public int insertAcademySourceList(int listTotalCount) throws Exception;

	public int listCurrCount();

	public int deleteAcademySourceList();

}
