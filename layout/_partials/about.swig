<div id="about" style="display:none">
    <div class="container">
        <section class="content">
            <div id="about-card">
                <span id="about-btn-close">
                    <i class="fa fa-remove"></i>
                </span>
                 {% if theme.custom_logo_image %}
                 <img id="about-card-picture" src="{{ theme.custom_logo_image }}" class="skip"/>
                 {% endif %}
                    <h4 id="about-card-name">Hi,I'm {{ config.author }}</h4>
                    <h5 id="about-card-bio"><p>If you have any question, please do not hesitate to contact me. :)</p></h5>
                    <div id="profile_social">
                        <h6>My Social Profiles</h6>
                            <a href="https://github.com/liuzc" target="_blank"><i class="fa fa-github"></i></a>
                            <a href="/images/me/wechat.png" target="_blank" rel="portfolio" class="info fancybox"><i class="fa fa-weixin"></i></a>
                            <a href="/images/me/myemail.jpg" target="_blank" class="fancybox"><i class="fa fa-envelope"></i></a>
                            <a href="https://www.flickr.com/photos/liuzc" target="_blank"><i class="fa fa-flickr"></i></a>
                            <a href="https://twiiter.com/liuzc89" target="_blank"><i class="fa fa-twitter"></i></a>
                    </div>
            </div>
        </section>
    </div>
</div>
