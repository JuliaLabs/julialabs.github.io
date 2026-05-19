@def title = "Julia Lab: Language, Composability, and Scientific Machine Learning (SciML)"
@def tags = ["syntax", "code"]

~~~
<style>
  body {
    background: #f3f4f2;
  }

  /* ─── Palette ──────────────────────────────────────────
     --accent  : #134535   deep forest green
     --rule    : #d6dbd8   page dividers
     --text-1  : #1c2c28   near-black body
     --text-2  : #4a5e58   secondary
     --text-3  : #8aa09a   meta / labels

     Footer (light bg):
     --ft-text-1 : #162820   dark headings
     --ft-text-2 : #2e4a40   body
     --ft-text-3 : #4a6a5e   secondary links
     --ft-rule   : rgba(0,0,0,0.10)
  ────────────────────────────────────────────────────── */

  .hn13 {
    color: #1c2c28;
    font-size: 15px;
    line-height: 1.55;
  }

  .hn13 a {
    color: inherit;
  }

  /* ─── Centred column ─── */
  .hn13-col {
    max-width: 1010px;
    width: calc(100% - 48px);
    margin-left: auto;
    margin-right: auto;
  }

  /* ─── Photo grid ─── */
  .hn13-col:has(.hn13-grid) {
    margin-top: 20px;
  }

  .hn13-grid {
    overflow: hidden;
    background: #e6ecea;
    border: 1px solid #cdd6d2;
    border-radius: 8px;
  }

  .hn13-grid .ri-grid {
    margin: 0;
    width: 100%;
  }

  .hn13-grid .ri-shadow:before,
  .hn13-grid .ri-shadow:after {
    display: none;
  }

  .hn13-grid .ri-grid ul li {
    background: #fff;
  }

  /* ─── Sections ─── */
  .hn13-section {
    padding-top: 44px;
  }

  .hn13-section:first-child {
    padding-top: 24px;
  }

  .hn13-section + .hn13-section {
    border-top: 1px solid #d6dbd8;
  }

  .hn13-section:last-child {
    padding-bottom: 64px;
  }

  /* ─── Section heads ─── */
  .hn13-section-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    margin-bottom: 28px;
  }

  .hn13 h2,
  .franklin-content .hn13 h2 {
    margin: 0;
    padding: 0;
    border: 0;
    color: #8aa09a;
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    line-height: 1;
  }

  .hn13-section-head-link {
    color: #134535 !important;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    text-decoration: none !important;
    white-space: nowrap;
    transition: opacity 0.15s;
  }

  .hn13-section-head-link:hover {
    opacity: 0.7;
  }

  /* ─── Videos ─── */
  .hn13-videos {
    gap: 14px;
  }

  .hn13-videos iframe {
    background: #0e1814;
    border-radius: 5px;
    box-shadow: 0 4px 18px rgba(0, 0, 0, 0.18), 0 1px 4px rgba(0, 0, 0, 0.1);
  }

  /* ─── News ─── */
  .hn13-news-list {
    display: grid;
  }

  .hn13-news-list .home-next-4-news-entry {
    display: grid;
    grid-template-columns: 44px minmax(0, 1fr);
    gap: 28px;
    align-items: baseline;
    padding: 16px 10px;
    margin: 0 -10px;
    border-top: 1px solid #d6dbd8;
    border-radius: 6px;
    transition: background 0.15s;
  }

  .hn13-news-list .home-next-4-news-entry:hover {
    background: rgba(27, 92, 72, 0.06);
  }

  .hn13-news-list .home-next-4-news-entry:first-child {
    border-top: 0;
    padding-top: 0;
  }

  .hn13-news-list .home-next-4-news-date {
    display: flex;
    flex-direction: column;
    gap: 1px;
    padding-top: 3px;
  }

  .hn13-news-list .home-next-4-news-date span:first-child {
    color: #134535;
    font-size: 9px;
    font-weight: 700;
    letter-spacing: 0.1em;
    text-transform: uppercase;
  }

  .hn13-news-list .home-next-4-news-date span:last-child {
    color: #134535;
    font-size: 18px;
    font-weight: 700;
    line-height: 1;
    letter-spacing: -0.02em;
  }

  .hn13-news-list .home-next-4-news-entry p {
    margin: 0;
    color: #2c3c38;
    font-size: 15px;
    line-height: 1.55;
  }

  .hn13-news-list .home-next-4-news-entry a {
    color: #1c2c28 !important;
    text-decoration: none !important;
  }

  .hn13-news-list .home-next-4-news-entry a:hover {
    color: #134535 !important;
    text-decoration: underline !important;
    text-underline-offset: 2px;
  }


  /* ─── Responsive ─── */
  @media (max-width: 680px) {
    .hn13-videos {
      grid-template-columns: 1fr !important;
    }
  }

  @media (max-width: 620px) {
    .hn13-col {
      width: calc(100% - 32px);
    }

    .hn13-section-head {
      flex-wrap: wrap;
    }

    .hn13-news-list .home-next-4-news-entry {
      grid-template-columns: 38px minmax(0, 1fr);
      gap: 18px;
    }
  }
</style>

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

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.gridrotator.js"></script>
<script type="text/javascript">
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
