# Current members

~~~
<div class="people-container">
        {{for (name, position, website, photo_path) in current_members}}
            <div class="people">
                <center>
                <img class="circle" width="100" height="100" src="/assets/people/{{fill photo_path}}"/><br>
                <a href="{{fill website}}">
                    {{fill name}}<br>
                    {{fill position}}<br>
                </a>
            </div>
        {{end}}
</div>
~~~

# Alumni
~~~
<div class="people-container">
        {{for (name, position, website, photo_path) in alumni}}
            <div class="people">
                <center>
                <img class="circle" width="100" height="100" src="/assets/people/{{fill photo_path}}"/><br>
                <a href="{{fill website}}">
                    {{fill name}}<br>
                    {{fill position}}<br>
                </a>
                </center>
            </div>
        {{end}}
</div>
~~~


# Collaborators

~~~
<div class="people-container">
        {{for (name, position, website, photo_path) in collaborators}}
            <div class="people">
                <center>
                <img class="circle" width="100" height="100" src="/assets/people/{{fill photo_path}}"/><br>
                <a href="{{fill website}}">
                    {{fill name}}<br>
                    {{fill position}}<br>
                </a>
            </div>
        {{end}}
</div>
~~~
