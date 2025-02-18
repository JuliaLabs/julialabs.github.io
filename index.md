@def title = "Julia Lab: Language, Composability, and Scientific Machine Learning (SciML)"
@def tags = ["syntax", "code"]


~~~
<div id="ri-grid" class="ri-grid ri-grid-size-1 ri-shadow">
    <img class="ri-loading-image" src="/assets/images/loading.gif"/>
    <ul>
        {{for (name, website, photo_path) in index_photos}}
          <li><a href="{{fill website}}" alt="{{fill name}}"><img src="/assets/{{fill photo_path}}"/></a></li>
        {{end}}
    </ul>
</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
<section class="videos">
<iframe src="https://www.youtube.com/embed/qGW0GT1rCvs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<iframe src="https://www.youtube.com/embed/tQpqsmwlfY0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<iframe src="https://www.youtube.com/embed/XRJ-rtP2fVE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</section>
~~~
