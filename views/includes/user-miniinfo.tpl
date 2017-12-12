{{strip}}
  {{\app\assets\UserMiniinfoAsset::register($this)|@void}}
  {{$stat = $user->userStat}}
  <div id="user-miniinfo" itemscope itemtype="http://schema.org/Person" itemprop="author">
    <div id="user-miniinfo-box">
      <h2>
        <a href="{{url route="show-user/profile" screen_name=$user->screen_name}}">
          <span class="miniinfo-user-icon">
            {{if $user->userIcon}}
              <img src="{{$user->userIcon->url|escape}}" width="48" height="48">
            {{else}}
              {{JdenticonWidget hash=$user->identiconHash class="identicon" size="48" schema="image"}}
            {{/if}}
          </span>
          <span itemprop="name" class="miniinfo-user-name">
            {{$user->name|escape}}
          </span>
        </a>
      </h2>
      {{if $stat}}
        <div class="row">
          <div class="col-xs-4">
            <div class="user-label">
              {{'Battles'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              <a href="{{url route="show/user" screen_name=$user->screen_name}}">
                {{$stat->battle_count|number_format|escape}}
              </a>
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Win %'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->wp === null}}
                {{'N/A'|translate:'app'|escape}}
              {{else}}
                {{$stat->wp|number_format:1|escape}}%
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'24H Win %'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->wp_short === null}}
                {{'N/A'|translate:'app'|escape}}
              {{else}}
                {{$stat->wp_short|number_format:1|escape}}%
              {{/if}}
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-4">
            <div class="user-label">
              {{'Avg Kills'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->total_kd_battle_count > 0}}
                {{$p = ['number' => $stat->total_kill, 'battle' => $stat->total_kd_battle_count]}}
                {{$s = '{number, plural, =1{1 kill} other{# kills}} in {battle, plural, =1{1 battle} other{# battles}}'|translate:'app':$p}}
                <span class="auto-tooltip" title="{{$s|escape}}">
                  {{($stat->total_kill/$stat->total_kd_battle_count)|number_format:2|escape}}
                </span>
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Avg Deaths'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->total_kd_battle_count > 0}}
                {{$p = ['number' => $stat->total_death, 'battle' => $stat->total_kd_battle_count]}}
                {{$s = '{number, plural, =1{1 death} other{# deaths}} in {battle, plural, =1{1 battle} other{# battles}}'|translate:'app':$p}}
                <span class="auto-tooltip" title="{{$s|escape}}">
                  {{($stat->total_death/$stat->total_kd_battle_count)|number_format:2|escape}}
                </span>
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              <span class="auto-tooltip" title="{{'Kill Ratio'|translate:'app'|escape}}">
                {{'Ratio'|translate:'app'|escape}}
              </span>
            </div>
            <div class="user-number">
              {{if $stat->total_kill == 0 && $stat->total_death == 0}}
                -
              {{else}}
                <span class="auto-tooltip" title="{{'Kill Rate'|translate:'app'|escape}}: {{($stat->total_kill/($stat->total_kill+$stat->total_death))|percent:1|escape}}">
                  {{if $stat->total_death == 0}}
                    ∞
                  {{else}}
                    {{($stat->total_kill/$stat->total_death)|number_format:2|escape}}
                  {{/if}}
                </span>
              {{/if}}  
            </div>
          </div>
        </div>

        {{* ナワバリ *}}
        <hr>
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="user-label">
              {{'Turf War'|translate:'app-rule'|escape}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Battles'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              <a href="{{url route="show/user" screen_name=$user->screen_name filter=["rule" => "nawabari"]}}">
                {{$stat->nawabari_count|number_format|escape}}
              </a>
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Win %'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->nawabari_wp === null}}
                {{'N/A'|translate:'app'|escape}}
              {{else}}
                {{$stat->nawabari_wp|number_format:1|escape}}%
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              <span class="auto-tooltip" title="{{'Kill Ratio'|translate:'app'|escape}}">
                {{'Ratio'|translate:'app'|escape}}
              </span>
            </div>
            <div class="user-number">
              {{if $stat->nawabari_kill == 0 && $stat->nawabari_death == 0}}
                -
              {{else}}
                <span class="auto-tooltip" title="{{'Kill Rate'|translate:'app'|escape}}: {{($stat->nawabari_kill/($stat->nawabari_kill+$stat->nawabari_death))|percent:1|escape}}">
                  {{if $stat->nawabari_death == 0}}
                    ∞
                  {{else}}
                    {{($stat->nawabari_kill/$stat->nawabari_death)|number_format:2|escape}}
                  {{/if}}
                </span>
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label auto-tooltip" title="{{'Total Inked'|translate:'app'|escape}}">
              {{'Total Inked'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->nawabari_inked > 0}}
                {{$_ = [
                    'point' => $stat->nawabari_inked,
                    'battle' => $stat->nawabari_inked_battle
                  ]}}
                {{$_msg = '{point, plural, other{#p}}'|translate:'app':$_}}
                <span class="auto-tooltip" title="{{$_msg|escape}}">
                  {{if $stat->nawabari_inked <= 99999}}
                    {{$stat->nawabari_inked|number_format|escape}}
                  {{elseif $stat->nawabari_inked <= 999999}}
                    {{($stat->nawabari_inked/1000)|number_format:0|escape}}k
                  {{elseif $stat->nawabari_inked <= 999999999}}
                    {{($stat->nawabari_inked/1000000)|number_format:2|escape}}M
                  {{else}}
                    {{($stat->nawabari_inked/1000000000)|number_format:2|escape}}G
                  {{/if}}
                </span>
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label auto-tooltip" title="{{'Avg Inked'|translate:'app'|escape}}">
              {{'Avg Inked'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->nawabari_inked > 0 && $stat->nawabari_inked_battle > 0}}
                {{$_ = [
                    'point' => $stat->nawabari_inked,
                    'battle' => $stat->nawabari_inked_battle
                  ]}}
                {{$_msg = '{point, plural, =1{1 point} other{# points}} in {battle, plural, =1{1 battle} other{# battles}}'|translate:'app':$_}}
                <span class="auto-tooltip" title="{{$_msg|escape}}">
                  {{($stat->nawabari_inked / $stat->nawabari_inked_battle)|number_format:1|escape}}
                </span>
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label auto-tooltip" title="{{'Max Inked'|translate:'app'|escape}}">
              {{'Max Inked'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->nawabari_inked_max > 0}}
                {{$stat->nawabari_inked_max|number_format|escape}}
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
        </div>
        <hr>
        {{* ガチ *}}
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="user-label">
              {{'Ranked Battle'|translate:'app-rule'|escape}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Battles'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              <a href="{{url route="show/user" screen_name=$user->screen_name filter=["rule" => "@gachi"]}}">
                {{$stat->gachi_count|number_format|escape}}
              </a>
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Win %'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->gachi_wp === null}}
                {{'N/A'|translate:'app'|escape}}
              {{else}}
                {{$stat->gachi_wp|number_format:1|escape}}%
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Peak'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->gachi_rank_peak > 0}}
                {{$stat->gachi_rank_peak|int2rank|escape}}
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>

          <div class="col-xs-4">
            <div class="user-label">
              {{'Avg Kills'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->gachi_kd_battle > 0}}
                {{$p = ['number' => $stat->gachi_kill, 'battle' => $stat->gachi_kd_battle]}}
                {{$s = '{number, plural, =1{1 kill} other{# kills}} in {battle, plural, =1{1 battle} other{# battles}}'|translate:'app':$p}}
                <span class="auto-tooltip" title="{{$s|escape}}">
                  {{($stat->gachi_kill/$stat->gachi_kd_battle)|number_format:2|escape}}
                </span>
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              {{'Avg Deaths'|translate:'app'|escape}}
            </div>
            <div class="user-number">
              {{if $stat->gachi_kd_battle > 0}}
                {{$p = ['number' => $stat->gachi_death, 'battle' => $stat->gachi_kd_battle]}}
                {{$s = '{number, plural, =1{1 death} other{# deaths}} in {battle, plural, =1{1 battle} other{# battles}}'|translate:'app':$p}}
                <span class="auto-tooltip" title="{{$s|escape}}">
                  {{($stat->gachi_death/$stat->gachi_kd_battle)|number_format:2|escape}}
                </span>
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              <span class="auto-tooltip" title="{{'Kill Ratio'|translate:'app'|escape}}">
                {{'Ratio'|translate:'app'|escape}}
              </span>
            </div>
            <div class="user-number">
              {{if $stat->gachi_kill == 0 && $stat->gachi_death == 0}}
                {{'N/A'|translate:'app'|escape}}
              {{else}}
                <span class="auto-tooltip" title="{{'Kill Rate'|translate:'app'|escape}}: {{($stat->gachi_kill/($stat->gachi_kill+$stat->gachi_death))|percent:1|escape}}">
                  {{if $stat->gachi_death == 0}}
                    ∞
                  {{else}}
                    {{($stat->gachi_kill/$stat->gachi_death)|number_format:2|escape}}
                  {{/if}}
                </span>
              {{/if}}
            </div>
          </div>

          <div class="col-xs-4">
            <div class="user-label">
              <span class="auto-tooltip" title="{{'Kills per minute'|translate:'app'|escape}}">
                {{'Kills/min'|translate:'app'|escape}}
              </span>
            </div>
            <div class="user-number">
              {{if $stat->gachi_total_time > 0}}
                {{($stat->gachi_kill2*60/$stat->gachi_total_time)|number_format:2|escape}}
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
          <div class="col-xs-4">
            <div class="user-label">
              <span class="auto-tooltip" title="{{'Deaths per minute'|translate:'app'|escape}}">
                {{'Deaths/min'|translate:'app'|escape}}
              </span>
            </div>
            <div class="user-number">
              {{if $stat->gachi_total_time > 0}}
                {{($stat->gachi_death2*60/$stat->gachi_total_time)|number_format:2|escape}}
              {{else}}
                {{'N/A'|translate:'app'|escape}}
              {{/if}}
            </div>
          </div>
        </div>
        <hr>
        <div class="miniinfo-databox">
          <p class="user-label">
            {{'Activity'|translate:'app'|escape}}
          </p>
          {{\app\assets\ActivityAsset::register($this)|@void}}
          <div class="text-center">
            <div class="activity" data-screen-name="{{$user->screen_name|escape}}">
            </div>
          </div>
        </div>
        <hr>
        <p class="miniinfo-databox">
          <a href="{{url route="show/user-stat-nawabari" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (Turf War)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-gachi" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (Ranked Battle)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-by-rule" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (by Mode)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-by-map" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (by Stage)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-by-map-rule" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (by Mode and Stage)'|translate:'app'|escape}}
          </a><br>
          <span style="padding-left:2em">
            ┗ <a href="{{url route="show/user-stat-by-map-rule-detail" screen_name=$user->screen_name}}">
            {{'Details'|translate:'app'|escape}}
            </a>
          </span><br>
          <a href="{{url route="show/user-stat-by-weapon" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (by Weapon)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-vs-weapon" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (vs. Weapon)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-cause-of-death" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Stats (Cause of Death)'|translate:'app'|escape}}
          </a><br>
          <a href="{{url route="show/user-stat-report" screen_name=$user->screen_name}}">
            <span class="fa fa-chart-pie left"></span>
            {{'Daily Report'|translate:'app'|escape}}
          </a>
        </p>
      {{/if}}
      {{if $user->mainWeapon}}
        <div class="miniinfo-databox">
          {{'Favorite Weapon'|translate:'app'|escape}}:&#32;
          {{$user->mainWeapon->name|translate:'app-weapon'|escape}}<br>
          <a href="{{url route="show/user-stat-by-weapon" screen_name=$user->screen_name}}">
            {{'List'|translate:'app'|escape}}
          </a>
        </div>
      {{/if}}
      {{$_icon = \app\assets\AppLinkAsset::register($this)}}
      <div class="miniinfo-databox">
        {{if $user->twitter != ''}}
          <div>
            <span class="fab fa-twitter fa-fw"></span>&#32;
            <a href="https://twitter.com/{{$user->twitter|escape:url}}" rel="nofollow" target="_blank">
              {{$user->twitter|escape}}
            </a>
          </div>
        {{/if}}
        {{if $user->nnid != ''}}
          <div>
            <span class="fa fa-fw">
              {{$_icon->nnid}}
            </span>&#32;
            {{$user->nnid|escape}}
          </div>
        {{/if}}
        {{if $user->sw_friend_code != ''}}
          <div>
            <span class="fa fa-fw">
              {{$_icon->switch}}
            </span>&#32;
            <span style="white-space:nowrap">
              SW-
              {{$user->sw_friend_code|substr:0:4|escape}}-
              {{$user->sw_friend_code|substr:4:4|escape}}-
              {{$user->sw_friend_code|substr:8:4|escape}}
            </span>
          </div>
        {{/if}}
        {{if $user->ikanakama2 != ''}}
          <div>
            <span class="fa fa-fw">
              {{$_icon->ikanakama}}
            </span>&#32;
            <a href="https://ikanakama.ink/users/{{$user->ikanakama2|escape:url}}" rel="nofollow" target="_blank">
              {{'Ika-Nakama 2'|translate:'app'|escape}}
            </a>
          </div>
        {{/if}}
      </div>
      <div class="miniinfo-databox">
        {{$_asset = \app\assets\RemoteFollowAsset::register($this)}}
        OStatus ({{'GNU Social, Mastodon etc.'|translate:'app'|escape}}):<br>
        <button id="miniinfo-remote-follow" class="btn btn-default btn-xs" disabled>
          <span class="fa fa-fw"><img src="{{$app->assetManager->getAssetUrl($_asset, 'ostatus.min.svg')|escape}}" style="width:auto;height:1em;vertical-align:baseline"></span>
          {{'Remote Follow'|translate:'app'|escape}}
        </button>
        {{include file='includes/remote-follow-modal.tpl'}}
      </div>
    </div>
  </div>
{{/strip}}
