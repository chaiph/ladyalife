<script src="static/js/fileupload.js" type="text/javascript"></script>

<div class="pageContent">
<link rel="stylesheet" href="${ctxStatic!}/css/main.form.css" />
<script type="text/javascript">
	$(function(){
		selectValue_att('city', "${corp.city?if_exists}");
		selectValue_att('corp_status', "${corp.status?default('10')}");
		selectValue_att('type', "${corp.type?default('10')}");

        upfile('uploadify_add', 'fileQueue_add');
	});
</script>
<form method="post" action="${ctx!}/corp/edit.jspx" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
    <input name="corp.fileHash" type="hidden" value="${corp.fileHash?if_exists}"/>
	<div class="pageFormContent" layoutH="57">
		<fieldset>
		<legend>基本信息</legend>
		<dl>
			<dt>状态：</dt>
			<dd>
				<select class="required combox" name="corp.status" id = "corp_status">
					<#list corp_status_list as bean>
						<option value="${bean[0]}">${bean[1]}</option>
					</#list>
				</select>
			</dd>
		</dl>
		<dl>
			<dt>简称：</dt>
			<dd><input name="corp.code" type="text" class="required" maxlength="32" value="${corp.code?if_exists}"/></dd>
		</dl>
		<dl>
			<dt>开票名称：</dt>
			<dd><input name="corp.name" type="text" class="required"  maxlength="32" value="${corp.name?if_exists}"/></dd>
		</dl>
		<dl>
			<dt>客户质量：</dt>
			<dd>
				<select class="required combox" name="corp.type" id = "type">
					<#list corp_quality_list as bean>
						<option value="${bean[0]}">${bean[1]}</option>
					</#list>
				</select>
			</dd>
		</dl>
		<div class="divider"></div>
		<dl>
			<dt>城市：</dt>
			<dd>
				<input class="required" name="city.name" type="text" postField="keyword" suggestFields="code,name" 
				suggestUrl="${ctx!}/base/queryCity.jspx" lookupGroup="city" value="${(citys_maps[corp.city?string])!''}"/>
				<input class="readonly" name="city.code"  type="hidden" value="${(corp.city?if_exists)!''}"/>
			</dd>
		</dl>
		<dl>
			<dt>合作到期：</dt>
			<dd><input name="corp.expireDate" type="text" class="wd date textInput readonly valid"  value="${(corp.expireDate?string('yyyy-MM-dd'))!''}" /></dd>
		</dl>
		<dl style="height: 60px;">
			<dt>收费情况：</dt>
			<dd><textarea name="corp.fee" rows="4" cols="50" class="">${corp.fee?if_exists}</textarea></dd>
		</dl>
		</fieldset>
		<#-- <dl>
			<dt>邮箱：</dt>
			<dd><input name="corp.email" type="text" maxlength="32" value="${corp.email?if_exists}"/></dd>
		</dl> -->
		<dl style="height: 100px;">
			<dt>联系方式：</dt>
			<dd>
				<textarea name="corp.contact" rows="6" cols="140" class="required" >${corp.contact?if_exists}</textarea>
			</dd>
		</dl>
		<div class="divider"></div>
		<dl style="height: 210px;">
			<dt>公司简介：</dt>
			<dd>
				<textarea class="editor" name="corp.intro" rows="14" cols="140" tools="Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About" >${corp.intro?if_exists}</textarea>
			</dd>
		</dl>
		<div class="divider"></div>
		<dl style="height: 210px;width: 600px;">
			<dt>公司文件：</dt>
			<dd style="width: 300px;">
				<input id="uploadify_add" type="file" name="uploadFile"/>
				<div id="fileQueue_add" class="fileQueue"></div>
				<a href="javascript:$('#uploadify_add').uploadify('upload', '*');" ><img alt="" src="${ctxThird!}/dwz/uploadify/img/upload.jpg"></a>
				<a href="javascript:$('#uploadify_add').uploadify('cancel', '*');" ><img alt="" src="${ctxThird!}/dwz/uploadify/img/cancel.jpg"></a>
			</dd>
		</dl>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
</form>
</div>
