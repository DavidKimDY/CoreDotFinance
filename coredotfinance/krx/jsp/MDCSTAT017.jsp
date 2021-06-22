
<form action="null" class="CI-MDI-COMPONENT-WRAP" id="MDCSTAT017_FORM" method="post" name="MDCSTAT017_FORM" onsubmit="return false;">
<h2 class="tit_h2">
<p>[12003] 개별종목 시세 추이</p>
<p class="address_top">
<span><img alt="홈으로 이동" src="/templets/mdc/img/ico_house.png"/></span>
<span>통계</span>
<span>기본 통계</span>
<span>주식</span>
<span>종목시세</span>
<span>개별종목 시세 추이</span>
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
<th scope="row">종목명</th>
<td>
<div class="searchBoxWrap">
<div class="search">
<p>
<input autocomplete="off" id="tboxisuCd_finder_stkisu0" name="tboxisuCd_finder_stkisu0" style="width: 350px;" title="주식 종목 검색" type="text" value="005930/삼성전자"/>
<img alt="검색팝업" id="btnisuCd_finder_stkisu0" name="btnisuCd_finder_stkisu0" src="/pub/img/btn_dbg.png"/>
</p>
</div>
</div>
<input id="isuCd_finder_stkisu0" name="isuCd" type="hidden" value="KR7005930003">
<input id="isuCd_finder_stkisu02" name="isuCd2" type="hidden" value="KR7005930003"/>
<input id="codeNmisuCd_finder_stkisu0" name="codeNmisuCd_finder_stkisu0" type="hidden" value="삼성전자"/>
<input id="param1isuCd_finder_stkisu0" name="param1isuCd_finder_stkisu0" type="hidden" value="ALL"/>
<input id="" name="" type="hidden" value=""/>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'FINDER_COMPONENT_isuCd_finder_stkisu0',
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
            if(cookie.codeVal)$sel('#isuCd_finder_stkisu0').val(cookie.codeVal);
            if(cookie.tbox)$sel('#tboxisuCd_finder_stkisu0').val(cookie.tbox);
            if(cookie.codeNm)$sel('#codeNmisuCd_finder_stkisu0').val(cookie.codeNm);
            if(cookie.codeVal2)$sel('#isuCd_finder_stkisu02').val(cookie.codeVal2);

            
          }
        }

        
      };

      

      $sel('#btnisuCd_finder_stkisu0').on('click', function () {

        if($sel('#tboxisuCd_finder_stkisu0').val()==""){
          self.openFinder(false);
        }else{
          self.openFinder(true);
        }

      });

      $sel('#tboxisuCd_finder_stkisu0').on('keydown', function (e) {
        if (13 == e.keyCode) {
          if($sel('#tboxisuCd_finder_stkisu0').val()==""){
            self.openFinder(false);
          }else{
            self.openFinder(true);
          }

        }
      });

      //쿠키 중복 방지
      self.getCookieFinderCd = function(){
        var cookieFinderCd = '';
        var curFinderCd = 'finder_stkisu';
        if(curFinderCd === 'finder_secuprodisu'){
          cookieFinderCd = 'finder_stkisu0';
        }
        else {
          cookieFinderCd = 'finder_stkisu';
        }
        return cookieFinderCd;
      };

      self.openFinder = function (isKeyDown) {
        var s_tboxNmVal = '';

        //캐쉬가 false/true선택관계없이 사용자가 검색어 입력시 그 값을 종목검색 팝업창에 전달
          var cookieFinderCd = self.getCookieFinderCd();
          var cookieFinderCdVal = api.util.getCookie(cookieFinderCd+'_finderCd');

            //검색텍스트박스값이 쿠키의 값과 같을경우 검색어 안넘어가도록
            var s_defaultVal = '005930/삼성전자';
            var s_tbox = api.util.getCookie(self.getCookieFinderCd()+'_tbox');

            if(s_tbox !== $sel('#tboxisuCd_finder_stkisu0').val() && s_defaultVal !== $sel('#tboxisuCd_finder_stkisu0').val()){
              s_tboxNmVal = $sel('#tboxisuCd_finder_stkisu0').val();
            }

        var params = {
          finderNo: '_finder_stkisu0',
          finderCd: 'finder_stkisu',
          typeNo: '0',
          compValue: '',
          param1 : $sel('#param1isuCd_finder_stkisu0').val(),
          tboxId : 'tboxisuCd_finder_stkisu0',
          tboxNm : s_tboxNmVal,
          codeValId : 'isuCd_finder_stkisu0',
          codeNmId : 'codeNmisuCd_finder_stkisu0',
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

            
                if ( $sel('#tboxisuCd_finder_stkisu0').val() != '' ) {
                  mdc.module.getModule('MDCSTAT017_')['getList']($sel('#tboxisuCd_finder_stkisu0'));
                }
            

            return false;
          }
          //=/

          mdc.layer.openModal({
            appendTo: $content.getNode(),
            className: 'pop_opened pop_opened1',
            id: 'jsLayer_finder_stkisu0',
            title: '주식 종목 검색',
            width: 548,
            height: 'auto',
            url: '/comm/finder/finder_stkisu.jsp',
            useCloseButton: false,
            ajaxOption: {data: params},
            focus: $(this),
            afterAppend: function () {
              api.module.getModule('FINDER_LAYER__finder_stkisu0').procInit();
            }
          });
        }
      };

      
      
      var isEmptyCodeVal = false;
      $sel('#tboxisuCd_finder_stkisu0').on('keyup', function (e) {
        if ( e.keyCode != 13 && !isEmptyCodeVal) {
          $sel('#isuCd_finder_stkisu0').val("");
          $sel('#isuCd_finder_stkisu02').val("");
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

  $('#tboxisuCd_finder_stkisu0').autocomplete({
    'contextName' : 'finder_stkisu',
    'bldPath' : '/dbms/comm/finder/finder_stkisu_autocomplete',
    'viewCount' : 5,
    'submit' : function (li) {

      var shotCd = li.attr('data-tp');
      var fullCd = li.attr('data-cd');
      var codeNm = li.attr('data-nm');
      var mktNm = 'ALL';

      $('#codeNmisuCd_finder_stkisu0').val(li.attr('data-nm'));
      $('#isuCd_finder_stkisu0').val(li.attr('data-cd'));
      $('#isuCd_finder_stkisu02').val(li.attr('data-tp'));

      // 지수면 명칭만
      if ( 'ISU' === 'IDX' ) {
        $('#tboxisuCd_finder_stkisu0').val(li.attr('data-nm'));
      }
      // 회사면 발행기관 코드
      else if ( 'ISU' === 'COM' ) {
        $('#tboxisuCd_finder_stkisu0').val(li.attr('data-cd')+'/'+li.attr('data-nm'));
      }
      // 그외 코드/명칭
      else {
        $('#tboxisuCd_finder_stkisu0').val(li.attr('data-tp')+'/'+li.attr('data-nm'));
      }

      var input = {
        finderCd: 'finder_stkisu',
        tbox: shotCd +'/'+ codeNm,
        codeNm: codeNm,
        codeVal: fullCd,
        codeVal2: fullCd,
        typeNo: '',
        param1: mktNm
      };

      //= (20201202, 김정삼)
      if ( 'ISU' === 'IDX' ) {//지수
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
<div class="cal-wrap"><input id="strdDd" name="strtDd" type="text" value="20210613"/><input id="endDd" name="endDd" type="text" value="20210621"/></div>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'SEARCH_COMPONENT__153503824',
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
    name: 'SEARCH_COMPONENT__153503825',
    mdi: {
      name: mdc.module.getMdiModuleName()
    },
    function: function (self, api) {
      var $content = api.getModuleNode();
      var $element = $content.select('[name="search"]');

      

      

      
        $element.on('click', function () {
          mdc.module.getModule('MDCSTAT017_')['getList']($(this));
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
<div id="jsGrid_MDCSTAT017_0">
<table>
<thead>
<tr>
<th align="center" name="TRD_DD" scope="col" width="85px">일자</th>
<th align="right" name="TDD_CLSPRC" scope="col" width="80px">종가</th>
<th align="right" name="CMPPREVDD_PRC" scope="col" width="70px">대비</th>
<th align="right" name="FLUC_RT" scope="col" width="70px">등락률</th>
<th align="right" name="TDD_OPNPRC" scope="col" width="80px">시가</th>
<th align="right" name="TDD_HGPRC" scope="col" width="80px">고가</th>
<th align="right" name="TDD_LWPRC" scope="col" width="80px">저가</th>
<th align="right" name="ACC_TRDVOL" scope="col" width="100px">거래량</th>
<th align="right" name="ACC_TRDVAL" scope="col" width="130px">거래대금</th>
<th align="right" name="MKTCAP" scope="col" width="150px">시가총액</th>
<th align="right" name="LIST_SHRS" scope="col" width="110px">상장주식수</th>
</tr>
</thead>
<tbody>
<tr>
<td bind="TRD_DD" name="TRD_DD"></td>
<td bind="TDD_CLSPRC" name="TDD_CLSPRC"></td>
<td bind="CMPPREVDD_PRC" name="CMPPREVDD_PRC"></td>
<td bind="FLUC_RT" name="FLUC_RT"></td>
<td bind="TDD_OPNPRC" name="TDD_OPNPRC"></td>
<td bind="TDD_HGPRC" name="TDD_HGPRC"></td>
<td bind="TDD_LWPRC" name="TDD_LWPRC"></td>
<td bind="ACC_TRDVOL" name="ACC_TRDVOL"></td>
<td bind="ACC_TRDVAL" name="ACC_TRDVAL"></td>
<td bind="MKTCAP" name="MKTCAP"></td>
<td bind="LIST_SHRS" name="LIST_SHRS"></td>
</tr>
</tbody>
</table>
</div>
<div class="result_bottom CI-MDI-COMPONENT-FOOTER on2">
<button class="CI-MDI-COMPONENT-BUTTON" type="button">Open</button>
<div data-component="footer" style="display: none;">
<span><dfn>컨텐츠 문의</dfn> : (유)주식시장부,  (코)코스닥시장부,  (넥)코넥스시장부,  고객센터 (1577-0088)</span>
<p><img alt="" src="/templets/mdc/img/blit_feel.png"/> 본 정보는 투자참고 사항이며, 오류가 발생하거나 지연될 수 있습니다. 제공된 정보에 의한 투자결과에 대한 법적인 책임을 지지 않습니다.</p>
</div>
</div>
<script type="text/javascript">
  mdc.module.setModule({
    name: 'MDCSTAT017_',
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
      var $f = $content.select('#MDCSTAT017_FORM');

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
              template: $content.select('#jsGrid_MDCSTAT017_0'),
              bld: 'dbms/MDC/STAT/standard/MDCSTAT01701',
              bldDataKey: 'output',
              unit: {
                share: ['ACC_TRDVOL', 'LIST_SHRS'],
                money: ['ACC_TRDVAL', 'MKTCAP']
              },
              fluctuation: {
                reference: 'FLUC_TP_CD',
                column: [
                  {
                    name: 'CMPPREVDD_PRC',
                    useArrow: true
                  },
                  {
                    name: 'FLUC_RT'
                  }
                ]
              }
            }
          ]
        });

        self.getList();
      };

      self.getList = function () {
        self.grid.appendRow(); // 설정한 form 과 bld 를 바탕으로 서비스 조회 후 그리드에 데이터 삽입
      }
    }
  });
</script>
