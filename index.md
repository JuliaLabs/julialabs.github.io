@def title = "Julia Lab"
@def tags = ["syntax", "code"]


~~~
<div id="ri-grid" class="ri-grid ri-grid-size-1 ri-shadow">
    <img class="ri-loading-image" src="/assets/images/loading.gif"/>
    <ul>
        {{for name in people_photos}}
          <li><a href="#"><img src="/assets/people/{{name}}"/></a></li>
        {{end}}
    </ul>
</div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.gridrotator.js"></script>
<script type="text/javascript">
    $(function() {
        $( '#ri-grid' ).gridrotator( {
            w320 : {
                rows : 3,
                columns : 6
            },
            w240 : {
                rows : 3,
                columns : 4
            },
            nochange : [],
            preventClick : false
        } );
    
    });
</script>

~~~

~~~
<center>
<iframe width="364" height="205" src="https://www.youtube.com/embed/qGW0GT1rCvs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<iframe width="364" height="205" src="https://www.youtube.com/embed/tQpqsmwlfY0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<iframe width="364" height="205" src="https://www.youtube.com/embed/XRJ-rtP2fVE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
~~~

~~~
<center>
<img  width="200" src="/assets/images/mit-logo.svg" />
<img  width="200" src="/assets/images/csail-logo.png" />
<img  width="200" src="/assets/images/mit-math-logo.png" />
</center>
~~~


