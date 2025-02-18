# News

~~~
<div class="news-container">
{{for (date, title, link) in news}}
    <div class="news">
        <div class="item">{{fill date}}</div>
        <a href="{{fill link}}">{{fill title}}</a>
    </div>
{{end}}
</div>
~~~
