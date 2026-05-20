@def title = "Julia Lab: Language, Composability, and Scientific Machine Learning (SciML)"
@def tags = ["syntax", "code"]

~~~
<div class="hn13">

  <!-- Rotating grid, constrained to content width -->
  <div class="hn13-col">
  <div class="hn13-grid" aria-label="Julia Lab people and research">
    <div id="ri-grid-next-13" class="ri-grid ri-grid-size-1 ri-shadow">
      <img class="ri-loading-image" src="/assets/images/loading.gif" alt="" />
      <ul>
        {{for (name, website, photo_path) in index_photos}}
          <li><a href="{{fill website}}"><img src="/assets/{{fill photo_path}}" alt="{{fill name}}" /></a></li>
        {{end}}
      </ul>
    </div>
  </div>
  </div><!-- /.hn13-col (grid) -->

  <div class="hn13-col">

    <!-- Featured Talks -->
    <section class="hn13-section">
      <div class="hn13-section-head">
        <h2>Featured Talks</h2>
      </div>
      <div class="videos hn13-videos">
        <iframe src="https://www.youtube.com/embed/qGW0GT1rCvs" title="Julia Lab selected talk one" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <iframe src="https://www.youtube.com/embed/tynmTkpdAME" title="Julia Lab selected talk two" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <iframe src="https://www.youtube.com/embed/16jtJDiJIuU" title="Julia Lab selected talk three" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      </div>
    </section>

    <!-- News -->
    <section class="hn13-section">
      <div class="hn13-section-head">
        <h2>News</h2>
        <a class="hn13-section-head-link" href="/news/">All news →</a>
      </div>
      <div class="hn13-news-list">
        {{fill homepage_news_preview_html}}
      </div>
    </section>

  </div><!-- /.hn13-col -->

</div><!-- /.hn13 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/jquery.gridrotator.js"></script>
<script>
  $(function() {
    $("#ri-grid-next-13").gridrotator({
      rows: 4,
      columns: 12,
      w1024: { rows: 4, columns: 10 },
      w768:  { rows: 4, columns: 7  },
      w480:  { rows: 4, columns: 4  },
      w320:  { rows: 4, columns: 3  },
      w240:  { rows: 4, columns: 2  },
      interval: 3200,
      maxStep: 3,
      animType: "fadeInOut",
      nochange: [],
      preventClick: false
    });
  });
</script>
~~~
