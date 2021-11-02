# Research/Grants

~~~
<div class="grants-container">
        {{for (name, full_name, description, full_description, website, photo_path, links) in grants}}
            <div class="grants">
                <center>
                <img class="circle" width="220" height="220" src="/assets/{{fill photo_path}}"/><br>
                <a href="{{fill website}}">
                    {{fill description}}<br>
                </a>
            </div>
        {{end}}
</div>
~~~


{{for (name, full_name, description, full_description, website, photo_path, links) in grants}}

## {{fill full_name}}
~~~
<img style="padding-right:10px" align="left" width="150" src="/assets/{{fill photo_path}}"\>
~~~
{{fill full_description}}
[Website]({{fill website}})

{{end}}


