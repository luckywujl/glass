define(['jquery', 'bootstrap', 'moment', 'moment/locale/zh-cn', 'bootstrap-table', 'bootstrap-table-lang', 'bootstrap-table-export', 'bootstrap-table-commonsearch', 'bootstrap-table-template'], function ($, undefined, Moment) {
    var Printing = {
        defaults:{
            url:'ezprint/printing/get'
        },
        config:{},
        api:{
            printTemplate:function(obj){
                var source = obj;
                var templateCode = obj.templateCode;
                var model = obj.data;
                var printStyle = obj.printStyle ? obj.printStyle:'';
                var marginLeft = obj.marginLeft? obj.marginLeft:'35';
                var marginRight = obj.marginRight? obj.marginRight:'35';
                if(templateCode==''){
                    alert('模板代码不能为空')
                    return;
                }
                var style='<style type="text/css" media="print">' +
                '  @page { size: auto;   margin: '+marginLeft+'px 0 '+marginRight+'px 0; }' +
                '</style>' +
                '<style type="text/css" media="all">' +
                'table{border-collapse: collapse; font-size: 12px; }\n' +
                'table, th, td {border: 1px solid grey}\n' +
                'th, td {text-align: center; vertical-align: middle;}\n' +
                'p {margin-left:20px; }\n' +
                'th {height:30px; }\n' +
                'table { width:94%; margin-left:3%; margin-right:3%}\n' +
                'div.bs-table-print { text-align:center;}\n' +
                'td > p > span { font-weight: inherit;}\n' +
                'td > p { font-weight: inherit;}\n' + printStyle +
                '</style>';
                var options = {url: Printing.defaults.url, data: {templateCode: templateCode}};
                Fast.api.ajax(options, function (data, ret) {
                    if(ret!=''){                       
                        var newWin = window.open("");
                        newWin.document.write(style+ret.data.content);
                        var oldNode=newWin.document.getElementsByClassName('printVar');
                        var nodelength=oldNode.length;
                        var copy ={ ...oldNode }
                        for(var i=0;i<nodelength;i++){      
                            const field = copy[i].getAttribute('data-field');   
                            const fieldValue = model[field] ? model[field] :'  ';
                            if(copy[i].children.length<1){
                                var newNode = newWin.document.createElement('span');                               
                                newNode.innerHTML= fieldValue;
                                copy[i].replaceWith(newNode);
                            }
                            else{
                                var firstChild = copy[i].firstChild;
                                firstChild.innerHTML = firstChild.innerHTML.replace(/\{([\s\S]+?)\}/g, function($0, $1) { return fieldValue || ''; });                                                                       
                                copy[i].replaceWith(firstChild);
                            }
                        }
                        //获取所有的列表
                        var tableList=newWin.document.querySelectorAll('table[data-type=dataSource]');
                        var tableListLenth=tableList.length;
                        var tableListLenthCopy ={ ...tableList }

                        for(var i=0;i<tableListLenth;i++){
                            //获取列表的id 判断数据源是由有此id
                            var tableId = tableListLenthCopy[i].getAttribute('id');
                            if(!obj[tableId]){
                                alert(tableId + '不存在')
                            }
                            var tableSource = obj[tableId]?obj[tableId]:[];
                            var fieldList = tableList[i].getElementsByClassName('printTableVar');

                            var tableContent = '<table><thead><tr>';
                            for(var k=0 ; k<fieldList.length;k++){
                                var fieldTitle = fieldList[k].textContent.replace('[','').replace(']','');
                                tableContent+='<th>'+ fieldTitle +'</th>';
                            }
                            tableContent += "</tr></thead><tbody>";

                            tableSource.forEach(element => {
                                tableContent+='<tr>';
                                for(var j=0 ; j<fieldList.length;j++){
                                    var tableFieldId = fieldList[j].getAttribute('data-field');
                                    var fieldValue =  element[tableFieldId] ? element[tableFieldId] :'';
                                    tableContent+='<td>'+ fieldValue +'</td>';
                                }
                                tableContent+='</tr>';
                            });
                            tableContent+='</tbody></table>';
                            tableListLenthCopy[i].innerHTML=tableContent;
                        }
                        newWin.print();
                        newWin.close();
                    }
                    else{
                        alert('模板不存在');
                    }
                })
            },
            getLastChild:function(node){
               if(node.lastChild){
                   return Printing.api.getLastChild(node.lastChild);
               }else{
                   return node;
               }
            }
        }
    }
    return Printing;
})