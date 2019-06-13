<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:choose>
	<c:when test="${member.m_type == '관리자' }">
		<tiles:insertDefinition name="admin" />
	</c:when>
	
	<c:otherwise>
		<tiles:insertDefinition name="intro" />
	</c:otherwise>
</c:choose>

<%--  <tiles:insertDefinition name="intro" /> --%>