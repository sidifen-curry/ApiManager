<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
        <!--
        font-family: SimSun

        ;
        -->
        body {
            font-family: Arial,"Microsoft YaHei","Lantinghei SC", "Open Sans",  "Hiragino Sans GB",  "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
        }

        pre {
            border: 0px;
            color: #000000;
            font-weight: 100;
            line-height: 24px;
            font-size: 18px;
        }

        td {
            padding: 5px;
        }

        tr {
            background: #F0F0F0;
        }

        h1, h2, h3, h4, h5 {
            color: #000000;
        }
    </style>
</head>
<body screen_capture_injected="true" ryt11773="1" style="padding:10px;">
<!-- 标题 -->
<div style="padding-left:4px;padding-bottom:0px; background:#fff;font-size:18px;font-weight:bold;">
    ${title}--模块【${moduleName}】
</div>
<div style="padding-right:4px;background:#fff; color:#000000;font-size:12px;text-align:right;">
    中国东信安全隐私号
</div>
<%--<div style="clear:both;height:2px;width:100%;background:#000;"></div>--%>
<!-- 列表 -->
<div style="font-size:18px;line-height:36px; padding:15px;>
    <div style="color:#000000;font-size:20px;">目录</div>
    <c:forEach var="f" items="${requestScope.interfaces}" varStatus="status">
        ${ status.index + 1}. ${f.model.interfaceName}<br/>
    </c:forEach>
</div>

<!-- 内容 -->
<c:forEach var="f" items="${requestScope.interfaces}" varStatus="status">
    <div style="height:20px;"></div>
    <div style="padding:20px;padding-top:10px; margin-top:20px;font-size:14px;color:#000;">
        <div style="margin-left:-10px;font-size:18px;font-weight:bold;">${ status.index + 1}、 ${f.model.interfaceName}</div>
        <h3>(1) 功能说明</h3>
            ${f.model.remark}
        <br/>
        <h3>(2) URL地址</h3>
            ${f.model.moduleUrl}${f.model.url}
        <br/>
        <br/>
        <h3>(3) 版本号</h3>
            ${f.model.version}
        <br/>
        <br/>

        <h3>(4) HTTP请求方式</h3>
            ${f.model.method}
        <br/>
        <br/>

        <h3>(5) 请求头说明</h3>
        <table style="width:100%; border: 1px solid #000;border-collapse: collapse;">
            <tr style="">
                <td>名称</td>
                <td>是否必须</td>
                <td>类型</td>
                <td>默认值</td>
                <td style="width:100px;">备注</td>
            </tr>
            <c:forEach var="v" items="${f.headers}">
                <tr>
                    <td>${v.name}</td>
                    <td style="width:50px;">${v.necessary}</td>
                    <td style="width:50px;">${v.type}</td>
                    <td style="width:50px;">${v.def}</td>
                    <td style="width:50px;">${v.remark}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <h3>(6) 输入参数说明<c:if test="${f.customParams!=null}">(自定义参数)</c:if></h3>
        <c:if test="${f.formParams!=null}">
            <table style="width:100%;border: 1px solid #000;border-collapse: collapse;">
                <tr style="">
                    <td>名称</td>
                    <td style="width:50px;">是否必须</td>
                    <td style="width:50px;">参数位置</td>
                    <td style="width:50px;">类型</td>
                    <td style="width:50px;">默认值</td>
                    <td style="width:100px;">备注</td>
                </tr>

                <c:forEach var="v" items="${f.formParams}">
                    <tr>
                        <td>${v.name}</td>
                        <td>${v.necessary}</td>
                        <td>${v.inUrl=='true'?'URL地址':'请求体'}</td>
                        <td>${v.type}</td>f
                        <td>${v.def}</td>
                        <td>${v.remark}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${f.customParams!=null}">
            <h5 style="color:#000000;">请求示列</h5>
            ${f.customParams}
            <br/><br/>
        </c:if>

        <h3>(7) 请求示例</h3>
        <div style=" padding:10px;">
            <pre style="font-size: 18px;">${f.model.requestExam}</pre>
        </div>
        <br/>

        <h3>(8) 返回contentType类型</h3>
            ${f.model.contentType}
        <br/>
        <br/>

        <br/>
        <h3>(9) 返回数据说明</h3>
        <table style="width:100%;border: 1px solid #000;border-collapse: collapse;">
            <tr style="">
                <td>名称</td>
                <td style="width:50px;">类型</td>
                <td style="width:50px;">是否必须</td>
                <td style="width:80px;">备注</td>
            </tr>
            <c:forEach var="v" items="${f.responseParam}">
                <tr>
                    <td style="padding-left:${v.deep*15}px'" >
                        <div>${v.realName}</div>
                    </td>
                    <td>${v.type}</td>
                    <td>${v.necessary}</td>
                    <td>${v.remark}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <h3>(10) 正确返回示例</h3>
        <div style=" padding:10px;">
            <pre style="font-size: 18px;">${f.model.trueExam}</pre>
        </div>
        <br/>
        <h3>(11) 错误返回示例</h3>
        <div style="padding:10px;">
            <pre style="font-size: 18px;">${f.model.falseExam}</pre>
        </div>
        <br/>
        <h3>(12) 错误码</h3>
        <table style="width:100%;border: 1px solid #000;border-collapse: collapse;">
            <tr style="">
                <td>Code</td>
                <td>Msg</td>
            </tr>
            <c:forEach var="v" items="${f.errors}">
                <tr>
                    <td>${v.errorCode}</td>
                    <td>${v.errorMsg}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:forEach>


</body>
</html>