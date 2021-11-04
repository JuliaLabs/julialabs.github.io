# Research/Grants

~~~
<div class="grants-container">
        {{for (name, full_name, description, full_description, website, photo_path, links) in grants}}
            <div class="grants">
                <center>
                <img class="circle" width="220" height="220" src="/assets/{{fill photo_path}}"/><br>
                <a href="#{{fill name}}">
                    {{fill description}}<br>
                </a>
            </div>
        {{end}}
</div>
~~~

~~~
{{for (name, full_name, description, full_description, website, photo_path, links) in grants}}
    <h2 id="{{fill name}}" class="header-anchor">{{fill full_name}}</h2>
    <div>
    <img style="margin-right:10px;margin-top:-10px" align="left" class="circle" width="120" height="120" src="/assets/{{fill photo_path}}"/>
    </div>
    {{fill full_description}}
    <a href="{{fill website}}">Website</a>
    <br><br>
{{end}}
<br><br>
~~~
