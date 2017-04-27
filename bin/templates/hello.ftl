<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello ${foo}!</title>
</head>
<body>
    <h2>Hello ${foo}!</h2>
    
    
    <#if 'test' == 'test111'>
		  같아요 같아
	<#else>
		  같지않습니다sdlfksdlfksdlfklsdkflk
	</#if>
	
	
	<#list users as user>
	  <p>${user}
	</#list>
    
</body>
</html>