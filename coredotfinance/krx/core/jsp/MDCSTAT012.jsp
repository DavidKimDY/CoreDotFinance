
<form action="null" class="CI-MDI-COMPONENT-WRAP" id="MDCSTAT012_FORM" method="post" name="MDCSTAT012_FORM" onsubmit="return false;">
<input name="indTpCd" type="hidden"/>
<input name="idxIndCd" type="hidden"/>
<h2 class="tit_h2">
<p>[11012] 개별지수 시세 추이</p>
<p class="address_top">
<span><img alt="홈으로 이동" src="/templets/mdc/img/ico_house.png"/></span>
<span>통계</span>
<span>기본 통계</span>
<span>지수</span>
<span>파생 및 기타지수</span>
<span>개별지수 시세 추이</span>
</p>
</h2>
<div class="search_tb">
<div data-component="search">
<table>
<colgroup>
<col class="fix_w_s5"/>
<col/>
</colgroup>
<tbody>
<tr>
<th scope="row">지수명</th>
<td>
<div class="searchBoxWrap">
<div class="search">
<p>
<input autocomplete="off" id="tboxidxCd_finder_drvetcidx0" name="tboxidxCd_finder_drvetcidx0" style="width: 350px;" title="파생 및 기타지수 검색" type="text" value=""/>
<img alt="검색팝업" id="btnidxCd_finder_drvetcidx0" name="btnidxCd_finder_drvetcidx0" src="/pub/img/btn_dbg.png"/>
</p>
</div>
</div>
<input id="idxCd_finder_drvetcidx0" name="idxCd" type="hidden" value="">
<input id="idxCd_finder_drvetcidx02" name="idxCd2" type="hidden" value=""/>
<input id="codeNmidxCd_finder_drvetcidx0" name="codeNmidxCd_finder_drvetcidx0" type="hidden" value=""/>
<input id="param1idxCd_finder_drvetcidx0" name="param1idxCd_finder_drvetcidx0" type="hidden" value=""/>
<input id="" name="" type="hidden" value=""/>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'FINDER_COMPONENT_idxCd_finder_drvetcidx0',
    init: 'init',
    mdi: {
      name: mdc.module.getMdiModuleName()
    },
    function: function (self, api) {
      var $content = api.getModuleNode();
      var $sel = $content.select;

      self.init = function () {
        
        var cookie = mdc.util.getFinderCookie(self.getCookieFinderCd());
        if(cookie.finderCd === self.getCookieFinderCd()){
          // typeNo별 쿠키종목을 구분해야하는 경우(ex 증권상품)를 위해 분기
          var typeNo = cookie.typeNo; //쿠키저장시 finder의 typeNo
          if(!typeNo){
            typeNo = '0';
          }
          if(typeNo == ('0')){
            if(cookie.codeVal)$sel('#idxCd_finder_drvetcidx0').val(cookie.codeVal);
            if(cookie.tbox)$sel('#tboxidxCd_finder_drvetcidx0').val(cookie.tbox);
            if(cookie.codeNm)$sel('#codeNmidxCd_finder_drvetcidx0').val(cookie.codeNm);
            if(cookie.codeVal2)$sel('#idxCd_finder_drvetcidx02').val(cookie.codeVal2);

            
          }
        }

        
      };

      

      $sel('#btnidxCd_finder_drvetcidx0').on('click', function () {

        if($sel('#tboxidxCd_finder_drvetcidx0').val()==""){
          self.openFinder(false);
        }else{
          self.openFinder(true);
        }

      });

      $sel('#tboxidxCd_finder_drvetcidx0').on('keydown', function (e) {
        if (13 == e.keyCode) {
          if($sel('#tboxidxCd_finder_drvetcidx0').val()==""){
            self.openFinder(false);
          }else{
            self.openFinder(true);
          }

        }
      });

      //쿠키 중복 방지
      self.getCookieFinderCd = function(){
        var cookieFinderCd = '';
        var curFinderCd = 'finder_drvetcidx';
        if(curFinderCd === 'finder_secuprodisu'){
          cookieFinderCd = 'finder_drvetcidx0';
        }
        else {
          cookieFinderCd = 'finder_drvetcidx';
        }
        return cookieFinderCd;
      };

      self.openFinder = function (isKeyDown) {
        var s_tboxNmVal = '';

        //캐쉬가 false/true선택관계없이 사용자가 검색어 입력시 그 값을 종목검색 팝업창에 전달
          var cookieFinderCd = self.getCookieFinderCd();
          var cookieFinderCdVal = api.util.getCookie(cookieFinderCd+'_finderCd');

            //검색텍스트박스값이 쿠키의 값과 같을경우 검색어 안넘어가도록
            var s_defaultVal = '';
            var s_tbox = api.util.getCookie(self.getCookieFinderCd()+'_tbox');

            if(s_tbox !== $sel('#tboxidxCd_finder_drvetcidx0').val() && s_defaultVal !== $sel('#tboxidxCd_finder_drvetcidx0').val()){
              s_tboxNmVal = $sel('#tboxidxCd_finder_drvetcidx0').val();
            }

        var params = {
          finderNo: '_finder_drvetcidx0',
          finderCd: 'finder_drvetcidx',
          typeNo: '0',
          compValue: '',
          param1 : $sel('#param1idxCd_finder_drvetcidx0').val(),
          tboxId : 'tboxidxCd_finder_drvetcidx0',
          tboxNm : s_tboxNmVal,
          codeValId : 'idxCd_finder_drvetcidx0',
          codeNmId : 'codeNmidxCd_finder_drvetcidx0',
          pnlid : '',
          disableCompValue: '',
          initSearch: 'false'
        };

        if(!isKeyDown){
          params.tboxNm = '';
        }

        if(mdc.validate.checkSearchText(params.tboxNm)){
          //= (20201120, 김정삼) 자동검색 목록을 선택목록 엔터키 입력 시 검색기 팝업 하지 않는다.
          //  >>> 개발담당자 로직 확인하자
          var $searchAuto = $sel('.search-auto');
          var visble = $searchAuto.is(':visible');
          // 목록에 1개 있을 때 enter 키인시 선택
          if ( visble && $searchAuto.find('li').length == 1 ) {
            $searchAuto.find('li').addClass('on');
          }
          var $selLi = $searchAuto.find('li.on');

          if ( visble && $selLi.length ) {
            $('a', $selLi).click();

            
                if ( $sel('#tboxidxCd_finder_drvetcidx0').val() != '' ) {
                  mdc.module.getModule('MDCSTAT012_')['getList']($sel('#tboxidxCd_finder_drvetcidx0'));
                }
            

            return false;
          }
          //=/

          mdc.layer.openModal({
            appendTo: $content.getNode(),
            className: 'pop_opened pop_opened1',
            id: 'jsLayer_finder_drvetcidx0',
            title: '파생 및 기타지수 검색',
            width: 548,
            height: 'auto',
            url: '/comm/finder/finder_drvetcidx.jsp',
            useCloseButton: false,
            ajaxOption: {data: params},
            focus: $(this),
            afterAppend: function () {
              api.module.getModule('FINDER_LAYER__finder_drvetcidx0').procInit();
            }
          });
        }
      };

      
      
      var isEmptyCodeVal = false;
      $sel('#tboxidxCd_finder_drvetcidx0').on('keyup', function (e) {
        if ( e.keyCode != 13 && !isEmptyCodeVal) {
          $sel('#idxCd_finder_drvetcidx0').val("");
          $sel('#idxCd_finder_drvetcidx02').val("");
          isEmptyCodeVal = true;
        }
      });
      
    }
  });



  
  $.fn.defaultAutocomplete = $.fn.autocomplete;

  $.fn.autocomplete = function (options) {

    var _this = this;
    var isMouseUnder = false;

    var config = {
      'contextName' : 'output',
      'viewCount' : 7,
      'bldPath' : '',
      'submit' : undefined,
      'listFn' : undefined,
      'className' : 'search-auto',
      'submitClear' :  true,
      'searchCookie' : false,
      'searchCookieType' : '',
      'enterSubmit' : false,
      'param' : { }
    };

    if (options != null && options !== undefined) {
      $.extend(config, options);
    }

    var $searchAuto = $('<div></div>', {
      'class' : config.className,
      'css' : {
        'display' : 'none'
      }
    });

    $(_this).after($searchAuto);

    var submit = function (obj) {
      if (config.submit) {
        config.submit(obj);
      }
      $searchAuto.html('');
      $searchAuto.hide();
      if (config.submitClear) {
        $(_this).val('');
      }
    };

    $(_this).focusout(function () {
      if (!isMouseUnder) {
        $searchAuto.hide();
      }
    });

    $(_this).keyup(function (e) {
      if ((47 < e.keyCode && e.keyCode < 106) || (185 < e.keyCode && e.keyCode < 223) || (105 < e.keyCode && e.keyCode < 112) || 8 == e.keyCode || 46 == e.keyCode){
        if (!config.searchCookie){
          getSearchList();
        }
      }

      if (13 == e.keyCode && config.enterSubmit) {
        submit($searchAuto.find('li[data-selected=true]'));
      }

    });

    $(_this).keydown(function (e) {
      if(e.keyCode == 40) {
        var selected = $searchAuto.find('li[data-selected=true]');
        if (selected.length == 1) {
          selected.removeAttr('data-selected');
          selected.removeClass('on');

          var next = selected.next();
          next.attr('data-selected', 'true');
          next.addClass('on');
          $(_this).val(next.children('a').text());
        } else {
          var first = $searchAuto.find('li:first');
          first.attr('data-selected', 'true');
          first.addClass('on');
          $(_this).val(first.children('a').text());
        }
      }else if(e.keyCode == 38){
        var selected = $searchAuto.find('li[data-selected=true]');
        if (selected.length == 1) {
          selected.removeAttr('data-selected');
          selected.removeClass('on');

          var prev = selected.prev();
          prev.attr('data-selected', 'true');
          prev.addClass('on');
          $(_this).val(prev.children('a').text());
        } else {
          var last = $searchAuto.find('li:last');
          last.attr('data-selected', 'true');
          last.addClass('on');
          $(_this).val(last.children('a').text());
        }
      }
    }).click(function(e){
      if (config.searchCookie){
        if(Cookies.get(config.searchCookieType) != undefined){
          var schSaveData = Cookies.getJSON(config.searchCookieType);
          $ul = $('<ul/>');
          $.each(schSaveData, function(i, item){
            $ul.append('<li data-cd=\"'+ item.keyCd +'\" data-fcd=\"'+ item.KeyFullCd +'\" data-nm=\"'+ item.codNm +'\"><a href=\"#\">'+item.title+'</a></li>');
          });
          $searchAuto.html($ul);
          attachListEvent();
          $searchAuto.show();
        }
      }
    });

    var attachListEvent = function () {
      var li = $searchAuto.find('li');
      li.find('a').click(function () {
        submit($(this).parent());
        return false;
      });

      li.find('a').focusout(function () {
        $searchAuto.hide();
      });

      li.find('a').focus(function () {
        $searchAuto.show();
      });

      $searchAuto.find('ul').mouseleave(function () {
        isMouseUnder = false;
      });

      li.mouseenter(function () {
        li.removeAttr('data-selected');
        li.removeClass('on');
        var t = $(this);
        t.addClass('on');
        t.attr('data-selected', 'true');
        $(_this).val(t.children('a').text());
        isMouseUnder = true;
      });
    };

    var getSearchList = function () {
      var data = {
        'contextName' : config.contextName,
        'value' : encodeURIComponent($(_this).val()),
        'viewCount' : config.viewCount,
        'bldPath' : config.bldPath
      };
      $.extend(data, config.param);
      $.ajax({
        'url' : '/comm/finder/autocomplete.jspx',
        'data' : data,
        'success' : function (html) {
          if (html == '') {
            $searchAuto.hide();
          } else {
            var ul = '<ul>'+html+'</ul>';
            $searchAuto.html(ul);
            if (config.listFn) {
              config.listFn($searchAuto);
            }
            attachListEvent();
            $searchAuto.show();
          }
        }
      });
    };
  };

  $('#tboxidxCd_finder_drvetcidx0').autocomplete({
    'contextName' : 'finder_drvetcidx',
    'bldPath' : '/dbms/comm/finder/finder_drvetcidx_autocomplete',
    'viewCount' : 5,
    'submit' : function (li) {

      var shotCd = li.attr('data-tp');
      var fullCd = li.attr('data-cd');
      var codeNm = li.attr('data-nm');
      var mktNm = '';

      $('#codeNmidxCd_finder_drvetcidx0').val(li.attr('data-nm'));
      $('#idxCd_finder_drvetcidx0').val(li.attr('data-cd'));
      $('#idxCd_finder_drvetcidx02').val(li.attr('data-tp'));

      // 지수면 명칭만
      if ( 'IDX' === 'IDX' ) {
        $('#tboxidxCd_finder_drvetcidx0').val(li.attr('data-nm'));
      }
      // 회사면 발행기관 코드
      else if ( 'IDX' === 'COM' ) {
        $('#tboxidxCd_finder_drvetcidx0').val(li.attr('data-cd')+'/'+li.attr('data-nm'));
      }
      // 그외 코드/명칭
      else {
        $('#tboxidxCd_finder_drvetcidx0').val(li.attr('data-tp')+'/'+li.attr('data-nm'));
      }

      var input = {
        finderCd: 'finder_drvetcidx',
        tbox: shotCd +'/'+ codeNm,
        codeNm: codeNm,
        codeVal: fullCd,
        codeVal2: fullCd,
        typeNo: '',
        param1: mktNm
      };

      //= (20201202, 김정삼)
      if ( 'IDX' === 'IDX' ) {//지수
        input.tbox = codeNm;
        input.codeVal2 = shotCd;
      }
      //=/
      mdc.util.setFinderCookie(input);

      return false;
    },
    'submitClear' : false
  });
  
</script>
</input></td>
</tr>
<tr>
<th scope="row">조회기간</th>
<td>
<div class="cal-wrap"><input id="strdDd" name="strtDd" type="text" value="20210726"/><input id="endDd" name="endDd" type="text" value="20210803"/></div>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'SEARCH_COMPONENT__112303971',
    mdi: {
      name: mdc.module.getMdiModuleName()
    },
    function: function (self, api) {
      var $content = api.getModuleNode();
      var $element = $content.select('[name="endDd"]');

      
      var params = {
        baseName: 'krx.mdc.i18n.component',
        key: 'B128.bld'
      };

      var queryString = 'null';
      if (queryString && queryString !== 'null') {
        var queryArray = queryString.split('&');
        queryArray.forEach(function (query) {
          var name = query.split('=')[0];
          var value = query.split('=')[1] || '';
          params[name] = value;
        });
      }
      

      
        
          var calendarOption = {};
          var input = [];
          
            
              
              input.push($content.select('[name="strtDd"]'));
              
              input.push($content.select('[name="endDd"]'));
              
            
          

          
          var date = '';
          api.util.submitAjax({
            method: 'GET',
            url: '/comm/bldAttendant/executeForResourceBundle.cmd',
            async: false,
            data: params,
            success: function (data) {
              var output = data['result']['output'];
              output.forEach(function (item) {
                $.each(item, function (key, value) {
                  date = value;
                });
              });
            }
          });

          if (date) {
            input.forEach(function (item) {
              item.val(date);
            });

            //=== (20201028, 김정삼) compIdDateLimit 값을 지정한 경우 이 지정값(bld)으로 달력팝업활성화 종료일 기준을 변경한다
            
            calendarOption.limit = date;

            var compIdDateLimit = 'B128';
            var compId = 'B128';
            if (compIdDateLimit && compIdDateLimit !== compId) {
              api.util.submitAjax({
                method: 'GET',
                url: '/comm/bldAttendant/executeForResourceBundle.cmd',
                async: false,
                data: $.extend(params, {key: compIdDateLimit + '.bld'}),
                success: function (data) {
                  var output = data['result']['output'];
                  output.forEach(function (item) {
                    $.each(item, function (key, value) {
                      calendarOption.limit = value;
                    });
                  });
                }
              });
            }
            
            //===/

            //=== (20201215, 김상훈) restictId 값을 지정한 경우 이 지정값(bld)으로 조회가능 시작일을 제한한다.
            
            var restictId = 'B155';
            var menuId = mdc.getMdiView() ? mdc.getMdiView().id : '';

            if (restictId && (menuId !== '' && menuId !== undefined)) {
              params['menuId'] = menuId;
              api.util.submitAjax({
                method: 'GET',
                url: '/comm/bldAttendant/executeForResourceBundle.cmd',
                async: false,
                data: $.extend(params, {key: restictId + '.bld'}),
                success: function (data) {
                  var output = data['result']['output'];
                  calendarOption.restrictDate = output[0]['restrict_date'];
                }
              });
            }
            
            //===/

            
            // 기간 재계산
            var datePeriod = '-8d';
            var periodType = datePeriod.substring(datePeriod.length - 1); // +-d, +-m, +-y
            var period = Number(datePeriod.substring(0, datePeriod.length - 1));
            date = api.util.calcDate(date).getCalcDate(periodType, Math.abs(period));

            //20201215 김상훈, 달력 시작일자가 제한일보다 전일인 경우 제한일을 시작일로 설정
            if(calendarOption.restrictDate != undefined && date < calendarOption.restrictDate){
              date = calendarOption.restrictDate;
            }

            if (period >= 0) input[input.length - 1].val(date);
            else input[0].val(date);
            

          }
          

          calendarOption.input = input;
          calendarOption.positionTop = false;
          calendarOption.showButton = true;
          calendarOption.disabledDate = 'null';
          calendarOption.disabledTp = 'null';
          calendarOption.changeStrtDate = 'false';
          $.fn.calendar(calendarOption);
        

        
      

      

      
    }
  });
</script>
<a class="btn_black btn_component_search" href="javascript:void(0);" id="jsSearchButton" name="search">조회</a>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'SEARCH_COMPONENT__112303973',
    mdi: {
      name: mdc.module.getMdiModuleName()
    },
    function: function (self, api) {
      var $content = api.getModuleNode();
      var $element = $content.select('[name="search"]');

      

      

      
        $element.on('click', function () {
          mdc.module.getModule('MDCSTAT012_')['getList']($(this));
        });
      

      
    }
  });
</script>
</td>
</tr>
</tbody>
</table>
</div>
<button class="CI-MDI-COMPONENT-BUTTON btn_close_tggle" type="button">Close</button>
</div>
<div class="CI-MDI-UNIT-WRAP">
<div class="time CI-MDI-UNIT" data-view-sequence="0">
<p class="CI-MDI-UNIT-TIME"></p>
<p>
<select class="CI-MDI-UNIT-SHARE" disabled="" name="share" style="display: none;"><option selected="" value="1">주</option><option value="2">천주</option><option value="3">백만주</option></select>
<select class="CI-MDI-UNIT-MONEY" disabled="" name="money" style="display: none;"><option selected="" value="1">원</option><option value="2">천원</option><option value="3">백만원</option><option value="4">십억원</option></select>
<button class="CI-MDI-UNIT-FILTER" type="button"><img src="/templets/mdc/img/btn_time2.png" title="컬럼필터 팝업"/></button>
<button class="CI-MDI-UNIT-DOWNLOAD" type="button"><img src="/templets/mdc/img/btn_time1.png" title="다운로드 팝업"/></button>
</p>
</div>
</div>
<script type="text/javascript">
(function(mdc, $) {
  var $sel = $('select[name="otherUnit"].CI-MDI-UNIT-MONEY');
  if ( $('option',$sel).length <= 1 ) { $sel.addClass('bg_none'); }
}(window.mdc, jQuery));
</script>
</form>
<div id="jsGrid_MDCSTAT012_0">
<table>
<thead>
<tr>
<th align="center" name="TRD_DD" scope="col" width="100px">일자</th>
<th align="right" name="CLSPRC_IDX" scope="col" width="100px">종가</th>
<th align="right" name="PRV_DD_CMPR" scope="col" width="100px">대비</th>
<th align="right" name="UPDN_RATE" scope="col" width="100px">등락률</th>
<th align="right" name="OPNPRC_IDX" scope="col" width="100px">시가</th>
<th align="right" name="HGPRC_IDX" scope="col" width="100px">고가</th>
<th align="right" name="LWPRC_IDX" scope="col" width="100px">저가</th>
</tr>
</thead>
<tbody>
<tr>
<td bind="TRD_DD" name="TRD_DD"></td>
<td bind="CLSPRC_IDX" name="CLSPRC_IDX"></td>
<td bind="PRV_DD_CMPR" name="PRV_DD_CMPR"></td>
<td bind="UPDN_RATE" name="UPDN_RATE"></td>
<td bind="OPNPRC_IDX" name="OPNPRC_IDX"></td>
<td bind="HGPRC_IDX" name="HGPRC_IDX"></td>
<td bind="LWPRC_IDX" name="LWPRC_IDX"></td>
</tr>
</tbody>
</table>
</div>
<!--
<button type="button" id="jsHideColumn01">종목코드, 소속부 숨기기</button>
<button type="button" id="jsHideColumn02">시가, 고가 숨기기</button>
-->
<div class="result_bottom CI-MDI-COMPONENT-FOOTER on2">
<button class="CI-MDI-COMPONENT-BUTTON" type="button">Open</button>
<div data-component="footer" style="display: none;">
<span><dfn>컨텐츠 문의</dfn> : (경)인덱스사업부,  고객센터 (1577-0088)</span>
<p><img alt="" src="/templets/mdc/img/blit_feel.png"/> 본 정보는 투자참고 사항이며, 오류가 발생하거나 지연될 수 있습니다. 제공된 정보에 의한 투자결과에 대한 법적인 책임을 지지 않습니다.</p>
</div>
</div>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'MDCSTAT012_',
    init: 'init',
    mdi: {
      name: mdc.module.getMdiModuleName(),
      event: {
        afterViewActivated: ['resizeGrid'],
        afterViewSizeChanged: ['resizeGrid']
      }
    },
    function: function (self, api) {
      var $content = api.getModuleNode();
      var $f = $content.select('#MDCSTAT012_FORM');

      self.resizeGrid = function (e) {
        self.grid.setHeight(e.getContentLeftHeight());
        self.grid.resize();
      };

      self.init = function () {
        self.grid = api.util.grid.init({
          node: api.getModuleNode().getNode(),
          form: $f,
          layout: 'no-apply',
          grid: [
            {
              template: $content.select('#jsGrid_MDCSTAT012_0'),
              bld: 'dbms/MDC/STAT/standard/MDCSTAT01201',
              bldDataKey: 'output',
              fluctuation: {
                reference: 'FLUC_TP_CD',
                column: [
                  {
                    name: 'PRV_DD_CMPR',
                    useArrow: true
                  },
                  {
                    name: 'UPDN_RATE'
                  }
                ]
              }
            }
          ]
        });
        self.getList();
      };

      self.getList = function () {
        if (!$('input[name="idxCd"]').val()) {
          // 지수명을 검색해주세요.
          // api.layer.alert(api.lang.getMessage('ME004', ['지수명']));
          return;
        }
        if (!$('input[name="strtDd"]').val() || !$('input[name="endDd"]').val()) {
          // 조회기간을 선택해주세요.
          api.layer.alert(api.lang.getMessage('ME002', ['조회기간']));
          return;
        }

        $f.find('[name="indTpCd"]').val($f.find('[name="idxCd"]').val());
        $f.find('[name="idxIndCd"]').val($f.find('[name="idxCd2"]').val());

        self.grid.appendRow(); // 설정한 form 과 bld 를 바탕으로 서비스 조회 후 그리드에 데이터 삽입
      };

      $content.select('#jsHideColumn01').on('click', function () {
        self.grid.hideColumns(0, ['TRD_DD', 'PRV_DD_CMPR']);
      });

      $content.select('#jsHideColumn02').on('click', function () {
        self.grid.hideColumns(0, ['OPNPRC_IDX', 'HGPRC_IDX']);
      });
    }
  });
</script>
