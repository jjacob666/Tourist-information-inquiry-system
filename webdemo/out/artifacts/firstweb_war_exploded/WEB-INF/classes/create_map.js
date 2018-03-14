/*
* 创建地图所需JS
* create 2017-05-25 for Rika
* hope this helps ^_^
*/
function getMarkerListInfo(data, mapId, myListId, panelId, radius, keywordName, projectName, defaultKeyword, defaultProject){
    var map = new AMap.Map(mapId, {zoom: 9});
    AMapUI.loadUI([
        'misc/MarkerList', 
        'overlay/SimpleMarker', 
        'overlay/SimpleInfoWindow', 
        'overlay/AwesomeMarker'
    ],
    function(MarkerList, SimpleMarker, SimpleInfoWindow, AwesomeMarker) {
        // var $ = MarkerList.utils.$;//即jQuery/Zepto 表示下面可以使用$
        var defaultIconStyle = 'blue', //默认的图标样式
            hoverIconStyle = 'red', //鼠标hover时的图标样式
            selectedIconStyle = 'green'; //选中时的图标样式    
        var mapRenderData = {
            keyword: defaultKeyword, //右侧选择目录1
            project: defaultProject, //右侧选择目录2
        };
        $("#" + keywordName).on('click', ".item", function (e) {
            selectChangeTab($(this), keywordName);
            mapRenderData.keyword = $(this).text();
            loadData(data, mapRenderData.keyword, mapRenderData.project);
            window.markerList = markerList;
        });
        $("#" + projectName).on('click', ".item", function (e) {
            selectChangeTab($(this), projectName);
            mapRenderData.project = $(this).text();
            loadData(data, mapRenderData.keyword, mapRenderData.project);
            window.markerList = markerList;
        });
        function selectChangeTab(currentTab, idName){
            $('#' + idName + ' .item').removeClass('item-acitive');
            currentTab.addClass('item-acitive');
        }                                                      
        var markerList = new MarkerList({
            map: map,
            //ListElement对应的父节点或者ID [document.getElementById("myList")]
            listContainer: myListId, 
            //从数据中读取位置, 返回lng、Lat
            getPosition: function(item) {
                return [item.longitude, item.latitude];
            },
            //数据ID，如果不提供，默认使用数组索引，即index
            getDataId: function(item, index) {
                return item.id;
            },
            // 创建信息窗口
            getInfoWindow: function(data, context, recycledInfoWindow) {                    
                var content='<div class="info-middle">'+
                                '<img class="info-img" src="'+ data.pic +'">'+
                                '<div class="info-content"'+
                                    '<div>地址：'+ data.address +'</div>'+
                                '</div>'+
                            '</div>'+
                            '<div class="info-bottom">'+
                                '<img src="http://webapi.amap.com/images/sharp.png">'+
                            '</div>';
                if (recycledInfoWindow) {
                    recycledInfoWindow.setInfoTitle(data.name);
                    recycledInfoWindow.setInfoBody(content);
                    return recycledInfoWindow;
                }else {
                    return new SimpleInfoWindow({
                        infoTitle: '<b>'+ data.name + '</b>',
                        infoBody: content,
                        offset: new AMap.Pixel(0, -50)
                    });
                }
            },
            //构造marker用的options对象, 创建一个点标记
            //content和title支持模板，也可以是函数，返回marker实例，或者返回options对象
            getMarker: function(data, context, recycledMarker) {
                // var label = String.fromCharCode('A'.charCodeAt(0) + (context.index-1));
                var label = context.index;
                if (recycledMarker) {
                    recycledMarker.setIconLabel(label);
                    return;
                }else{
                    if(data.type === 'Own' || data.type === 'competitor') {
                        return new AwesomeMarker({
                            containerClassNames: 'my-marker',
                            awesomeIcon: 'star',
                            iconStyle: selectedIconStyle,
                            iconLabel: {
                                style: {
                                    color: '#fff',
                                    fontSize: '13px'
                                }
                            }
                        });
                    }else {
                        return new SimpleMarker({
                            containerClassNames: 'my-marker',
                            iconStyle: defaultIconStyle,
                            iconLabel: {
                                innerHTML: label,
                                style: {
                                    color: '#fff',
                                    fontSize: '13px'
                                }
                            }
                        });
                    }
                }
            },
            //构造右侧列表元素，与getMarker类似，可以是函数，返回一个dom元素，或者模板 html string
            getListElement: function(data, context, recycledListElement) {
                // var label = String.fromCharCode('A'.charCodeAt(0) + (context.index-1));
                var label = context.index;
                // var contextNow = context;
                var contentOld = data.type;
                // console.log('contentOld',contentOld);
                // console.log('contextNow',contextNow);
                // var label = context.index;
                //使用模板创建
                if(data.type === 'Own' || data.type === 'competitor'){
                    html = 
                        '<div class="poiHover">'+
                            '<div class="poi-info-left">' +
                            '    <span class="poi-point"><i class="fa fa-star"></i></span>'+
                            '    <%- data.name %>'+
                            '</div>' +
                            '<div class="poi-info-right">' +
                            '    <%= data.time %>  /  <%= data.km %>' +
                            '</div>'+
                        '</div>';           
                }else {
                    html = 
                        '<div class="poiHover">'+
                            '<div class="poi-info-left">' +
                            '    <span class="poi-point"><%- label %></span>'+
                            '    <%- data.name %>'+
                            '</div>' +
                            '<div class="poi-info-right">' +
                            '    <%= data.time %>  /  <%= data.km %>' +
                            '</div>'+
                        '</div>';   
                }
                var innerHTML = MarkerList.utils.template(html, {
                    data: data,
                    label: label
                });
                if (recycledListElement) { //存在可回收利用的listElement
                    recycledListElement.innerHTML = innerHTML; //更新innerHTML
                    // 判断后直接返回
                    // console.log(data.page);
                    if (data.page === '0') {
                        return  '<div class="poibox"><h3 class="margin-0 poi-info-title">'+data.type+'</h3>' + innerHTML + '</div>';
                    }else {
                        return '<div class="poibox">' + innerHTML + '</div>';
                    }
                }
                // console.log(data.page);
                if (data.page === '0') {
                    return  '<div class="poibox"><h3 class="margin-0 poi-info-title">'+data.type+'</h3>' + innerHTML + '</div>';
                }else {
                    return '<div class="poibox">' + innerHTML + '</div>';
                }
            },
            //列表节点上监听的事件
            listElementEvents: ['click', 'mouseenter', 'mouseleave'],
            //marker上监听的事件
            markerEvents: ['click', 'mouseover', 'mouseout'],
            autoSetFitView: true,
        });

        window.markerList = markerList;
        // 点击列表触发点标记联动
        markerList.on('selectedChanged', function(event, info) {
            // checkBtnStatus();
            if (info.selected) {
                if (info.selected.marker) {
                    //更新为选中样式
                    info.selected.marker.setIconStyle(selectedIconStyle);
                }
                //选中并非由列表节点上的事件触发，将关联的列表节点移动到视野内
                if (!info.sourceEventInfo.isListElementEvent) {
                    if (info.selected.listElement) {
                        scrollListElementIntoView($(info.selected.listElement));
                    }
                }
            }
            if (info.unSelected && info.unSelected.marker) {
                //更新为默认样式
                if(info.unSelected.data.type === 'Own' || info.unSelected.data.type === 'competitor'){
                    info.unSelected.marker.setIconStyle(selectedIconStyle); 
                }else{
                    info.unSelected.marker.setIconStyle(defaultIconStyle);
                }
            }
        });
        // 添加圆形范围
        markerList.on('markerAddToMap markerRemoveFromMap', function(event, record) {
            var marker = record.marker,
                lng = record.data.longitude,
                Lat = record.data.latitude;
            if(record.data.type === 'Own'){
                if (!marker._circle) {
                    //创建一个新的circle，附加在Marker上
                    marker._circle = new AMap.Circle({
                        center: new AMap.LngLat(lng, Lat),// 圆心位置
                        radius: radius, //半径
                        strokeColor: '#9cfea3', //线颜色
                        strokeOpacity: 1, //线透明度
                        strokeWeight: 1, //线粗细度
                        fillColor: '#1afa29', //填充颜色
                        fillOpacity: 0.25//填充透明度
                    });
                }
                switch (event.type) {
                    case 'markerAddToMap':
                        //更新map
                        marker._circle.setMap(marker.getMap());
                        //更新position
                        marker._circle.setCenter(marker.getPosition());
                        break;
                    case 'markerRemoveFromMap':
                        marker._circle.setMap(null);
                        break;
                }
            }
            if(record.data.type === 'competitor'){
                if (!marker._circle) {
                    //创建一个新的circle，附加在Marker上
                    marker._circle = new AMap.Circle({
                        center: new AMap.LngLat(lng, Lat),// 圆心位置
                        radius: radius, //半径
                        strokeColor: '#ff8383', //线颜色
                        strokeOpacity: 1, //线透明度
                        strokeWeight: 1, //线粗细度
                        fillColor: '#ee2200', //填充颜色
                        fillOpacity: 0.25//填充透明度
                    });
                }
                switch (event.type) {
                    case 'markerAddToMap':
                        //更新map
                        marker._circle.setMap(marker.getMap());
                        //更新position
                        marker._circle.setCenter(marker.getPosition());
                        break;
                    case 'markerRemoveFromMap':
                        marker._circle.setMap(null);
                        break;
                }
            }     
        });

        // 鼠标移至点标记的状态
        markerList.on('listElementMouseenter markerMouseover', function(event, record) {
            if (record && record.marker) {
                forcusMarker(record.marker);
                //非选中的id
                if (!this.isSelectedDataId(record.id)) {
                    //设置为hover样式
                    record.marker.setIconStyle(hoverIconStyle);
                }
            }
        });

        // 鼠标移出点标记的状态
        markerList.on('listElementMouseleave markerMouseout', function(event, record) {
            if (record && record.marker) {
                if (!this.isSelectedDataId(record.id)) {
                    //恢复默认样式
                    if(record.data.type === 'Own' || record.data.type === 'competitor'){
                        record.marker.setIconStyle(selectedIconStyle); 
                    }else{
                        record.marker.setIconStyle(defaultIconStyle);
                    }
                }
            }
        });  

        
        function loadData(data,keyword,project) {
            console.log('keyword',keyword);
            console.log('project',project);
            markerList.render(data);
            // 这里是获取数据的地方，如果后台传入数据，就注释掉284行，并将下面的ajax解开注释。function参数添加一个url。
            // $.ajax({
            //     url: url,
            //     type: 'post',
            //     dataType: 'json',
            //     data: {
            //         keyword: keyword, 
            //         project: project
            //     },
            //     success:function(result){
            //         markerList.render(result);
            //     }
            // });
        }

        loadData(data, mapRenderData.keyword, mapRenderData.project);

        // 移动至地图中心function
        function forcusMarker(marker) {
            marker.setTop(true);
            //不在地图视野内
            if (!(map.getBounds().contains(marker.getPosition()))) {
                //移动到中心
                map.setCenter(marker.getPosition());
            }
        }

        // 右侧列表联动
        function scrollListElementIntoView($listEle) {
            $('#'+ panelId).scrollTop($listEle.offset().top - $listEle.parent().offset().top);
            //闪动一下
            $listEle.one('webkitAnimationEnd oanimationend msAnimationEnd animationend');
        }
    });
}