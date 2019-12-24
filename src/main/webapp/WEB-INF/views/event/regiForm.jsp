<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    



<div class="container">

<h1 class="mt-4 mb-3">이벤트등록</h1>

<div class="row">
	<div class="col-lg-8 mb-4">
		<form method="post" action="${pageContext.request.contextPath}/event/insert" enctype="multipart/form-data">
			<c:choose>
				<c:when test="${status==40}">
					<input type="hidden" name="status" value="${status}">
					<div class="control-group form-group"><div class="controls">
						<label>문제 :</label> 
							<input type="text" class="form-control" name="title"  autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>힌트 :</label> 
							<input type="text" class="form-control" name="content"  autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>시작일 :</label> 
						<input type="date" class="form-control"
							name="startdate" required
							data-validation-required-message="날짜(시작)을 선택하세요."
							autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>종료일 :</label> 
						<input type="date" class="form-control"
							name="enddate" required
							data-validation-required-message="날짜(시작)을 선택하세요."
							autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>이미지 (필수아님) :</label>
						<input type="file" class="form-control" name="file1">
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>키워드(답) :</label> 
						<input type="text" class="form-control" name="keyword"  autocomplete=off>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>지급액 :</label>
						<input type="number" min="0" class="form-control" name="price" autocomplete=off>
					</div></div>
					<button type="submit" class="btn btn-primary">등록</button>
				</c:when>
				<c:when test="${status==30}">
					<div class="control-group form-group"><div class="controls">
						<label>종류 :</label> 
							<select class="form-control" name="status">
								<option value="31">최대1000캐시 룰렛 뽑기권</option>
								<option value="32">최대3000캐시 룰렛 뽑기권</option>
								<option value="33">최대5000캐시 룰렛 뽑기권</option>
							</select>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>시작일 :</label> 
						<input type="date" class="form-control"
							name="startdate" required
							data-validation-required-message="날짜(시작)을 선택하세요."
							autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>종료일 :</label> 
						<input type="date" class="form-control"
							name="enddate" required
							data-validation-required-message="날짜(시작)을 선택하세요."
							autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>이미지 (필수아님) :</label>
						<input type="file" class="form-control" name="file1">
						<p class="help-block"></p>
					</div></div>
					<button type="submit" class="btn btn-primary">등록</button>
				</c:when>
			 	<c:otherwise>
					<div class="control-group form-group"><div class="controls">
						<label>작품명 :</label> 
							<select class="form-control" name="contnum">
							<optgroup label="만화">
								<c:forEach var="webvo" items="${webCultype1}">
									<option value="${webvo.contnum}">${webvo.title}</option>
								</c:forEach>
							</optgroup>
							<optgroup label="소설">
								<c:forEach var="webvo" items="${webCultype2}">
									<option value="${webvo.contnum}">${webvo.title}</option>
								</c:forEach>
							</optgroup>
							<optgroup label="예능">
								<c:forEach var="webvo" items="${webCultype3}">
									<option value="${webvo.contnum}">${webvo.title}</option>
								</c:forEach>
							</optgroup>
							<optgroup label="드라마">
								<c:forEach var="webvo" items="${webCultype4}">
									<option value="${webvo.contnum}">${webvo.title}</option>
								</c:forEach>
							</optgroup>
							<optgroup label="영화">
								<c:forEach var="webvo" items="${webCultype5}">
									<option value="${webvo.contnum}">${webvo.title}</option>
								</c:forEach>
							</optgroup>
						</select>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>시작일 :</label> 
						<input type="date" class="form-control"
							name="startdate" required
							data-validation-required-message="날짜(시작)을 선택하세요."
							autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>종료일 :</label> 
						<input type="date" class="form-control"
							name="enddate" required
							data-validation-required-message="날짜(시작)을 선택하세요."
							autocomplete=off>
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>이미지 (필수아님) :</label>
						<input type="file" class="form-control" name="file1">
						<p class="help-block"></p>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>종류 :</label> 
						<select class="form-control" name="status">
							<optgroup label="열람">
								<option value="11">열람 -> 최대 1000캐시 룰렛</option>
								<option value="12">열람 -> 최대 3000캐시 룰렛</option>
								<option value="13">열람 -> 최대 5000캐시 룰렛</option>
							</optgroup>
							<optgroup label="리뷰">
								<option value="21">리뷰 -> 최대 1000캐시 룰렛</option>
								<option value="22">리뷰 -> 최대 3000캐시 룰렛</option>
								<option value="23">리뷰 -> 최대 5000캐시 룰렛</option>
							</optgroup>
				  	</select>
					</div></div>
				  <div class="control-group form-group"><div class="controls">
						<label>추천인원 :</label>
						<input type="number" value="3" min="0" class="form-control" name="human" autocomplete=off>
					</div></div>
					<div class="control-group form-group"><div class="controls">
						<label>열람회수 :</label>
						<input type="number" value="1" min="0" class="form-control" name="cnt" autocomplete=off>
					</div></div>
					<button type="submit" class="btn btn-primary">등록</button>
				</c:otherwise>
			</c:choose>
		</form>
    </div>
  </div>
</div>

