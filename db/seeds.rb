#coding: utf-8
regions = [
  { name_en: 'Altai Territory ', name_ru: 'Алтайский край', url: "http://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Coat_of_Arms_of_Altai_Krai.svg/200px-Coat_of_Arms_of_Altai_Krai.svg.png" },
  { name_en: 'Amur Region', name_ru: 'Амурская область', url: "http://upload.wikimedia.org/wikipedia/commons/4/42/Amurskaja_obl_coa_2008.gif" },
  { name_en: 'Arkhangelsk Region', name_ru: 'Архангельская область', url: "http://images.vector-images.com/29/arkhangelsk_obl_coa_n529.gif" },
  { name_en: 'Astrakhan Region', name_ru: 'Астраханская область', url: "http://www.megabook.ru/MObjects2/data/pict2006/new/06s1053.jpg" },
  { name_ru: 'Белгородская область' },
  { name_ru: 'Брянская область' },
  { name_ru: 'Владимирская область' },
  { name_ru: 'Волгоградская область' },
  { name_ru: 'Вологодская область' },
  { name_ru: 'Воронежская область' },
  { name_en: 'Moscow', name_ru: 'Город Москва', url: "http://heraldry.hobby.ru/m/moscow.jpg" },
  { name_ru: 'Еврейская автономная область' },
  { name_ru: 'Забайкальский край' },
  { name_ru: 'Ивановская область' },
  { name_ru: 'Иркутская область' },
  { name_ru: 'Кабардино-Балкарская Республика' },
  { name_ru: 'Калининградская область' },
  { name_ru: 'Калужская область' },
  { name_ru: 'Камчатский край' },
  { name_ru: 'Карачаево-Черкесская Республика' },
  { name_ru: 'Кемеровская область' },
  { name_ru: 'Кировская область' },
  { name_ru: 'Костромская область' },
  { name_en: 'Krasnodar Territory', name_ru: 'Краснодарский край', url: "http://heraldry.hobby.ru/k/krasnodar.gif" },
  { name_ru: 'Красноярский край' },
  { name_ru: 'Курганская область' },
  { name_ru: 'Курская область' },
  { name_ru: 'Ленинградская область' },
  { name_ru: 'Липецкая область' },
  { name_ru: 'Магаданская область' },
  { name_ru: 'Московская область' },
  { name_ru: 'Мурманская область' },
  { name_ru: 'Ненецкий автономный округ' },
  { name_ru: 'Нижегородская область' },
  { name_ru: 'Новгородская область' },
  { name_ru: 'Новосибирская область' },
  { name_ru: 'Омская область' },
  { name_en: 'Orenburg Region', name_ru: 'Оренбургская область', url: "http://upload.wikimedia.org/wikipedia/commons/6/68/Coat_of_Arms_of_Orenburg_oblast.png" },
  { name_ru: 'Орловская область' },
  { name_ru: 'Пензенская область' },
  { name_en: 'Perm Territory', name_ru: 'Пермский край', url: "http://courses-in-perm.ucoz.ru/_ph/6/2/199516501.jpg" },
  { name_ru: 'Приморский край' },
  { name_ru: 'Псковская область' },
  { name_ru: 'Республика Адыгея (Адыгея)' },
  { name_ru: 'Республика Алтай' },
  { name_ru: 'Республика Башкортостан' },
  { name_ru: 'Республика Бурятия' },
  { name_ru: 'Республика Дагестан' },
  { name_ru: 'Республика Ингушетия' },
  { name_ru: 'Республика Калмыкия' },
  { name_ru: 'Республика Карелия' },
  { name_ru: 'Республика Коми' },
  { name_ru: 'Республика Марий Эл' },
  { name_ru: 'Республика Мордовия' },
  { name_ru: 'Республика Саха (Якутия)' },
  { name_ru: 'Республика Северная Осетия — Алания' },
  { name_ru: 'Республика Татарстан (Татарстан)' },
  { name_ru: 'Республика Тыва' },
  { name_ru: 'Республика Хакасия' },
  { name_ru: 'Ростовская область' },
  { name_ru: 'Рязанская область' },
  { name_ru: 'Самарская область' },
  { name_en: 'St. Petersburg', name_ru: 'Санкт-Петербург', url: "http://www.peterburg.biz/images/stories/gerb_b.jpg" },
  { name_ru: 'Саратовская область' },
  { name_ru: 'Сахалинская область' },
  { name_ru: 'Свердловская область' },
  { name_ru: 'Смоленская область' },
  { name_ru: 'Ставропольский край' },
  { name_ru: 'Тамбовская область' },
  { name_ru: 'Тверская область' },
  { name_ru: 'Томская область' },
  { name_ru: 'Тульская область' },
  { name_en: 'Tyumen Region', name_ru: 'Тюменская область', url: "http://admtyumen.ru/files/%D0%93%D0%95%D0%A0%D0%91%20%D0%BF%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9.jpg" },
  { name_ru: 'Удмуртская Республика' },
  { name_ru: 'Ульяновская область' },
  { name_ru: 'Хабаровский край' },
  { name_ru: 'Ханты-Мансийский автономный округ — Югра' },
  { name_ru: 'Челябинская область' },
  { name_ru: 'Чеченская Республика' },
  { name_ru: 'Чувашская Республика — Чувашия' },
  { name_ru: 'Чукотский автономный округ' },
  { name_ru: 'Ямало-Ненецкий автономный округ' },
  { name_ru: 'Ярославская область' }
]

regions.each do |region|
  Region.create! name_ru: region[:name_ru], name_en: region[:name_en],
    remote_emblem_url: region[:url]
end

categories = [
  { name_ru: "Экономика", name_en: "Economy" },
  { name_ru: "Политика", name_en: "Politics" },
  { name_ru: "Культура", name_en: "Culture" }
]

categories.each do |category|
  Category.create! name_ru: category[:name_ru], name_en: category[:name_en]
end

years = [2010, 2011, 2012]

years.each do |year|
  Award.create! year: year, ended: true
end

Award.create! year: 2013

en_news = [
  { title: "Gerard Depardieu 'granted Russian citizenship'", slug: 'depardieu-russian-citizenship', category: 'Culture', tag_list: "Gerard Depardieu, overweight", url: "http://news.bbcimg.co.uk/media/images/65058000/jpg/_65058151_f29da479-90bc-4725-9414-c9ad0de563e6.jpg", content: "French actor Gerard Depardieu has obtained Russian citizenship, according to a brief statement posted on the Kremlin website.\n\"Vladimir Putin has signed a decree granting Russian citizenship to Gerard Depardieu,\" the message read.\nMr Depardieu recently announced he would give up his French passport after the government criticised his decision to move abroad to avoid higher taxes.\nIn December, Mr Putin said he would be happy to welcome the actor in Russia." },
  { title: "Obese who refuse to exercise 'could face benefits cut'", slug: 'obese-benefits-cut', category: 'Culture', tag_list: "obese, overweight", url: "http://news.bbcimg.co.uk/media/images/65056000/jpg/_65056227_65056226.jpg", content: "Overweight or unhealthy people who refuse to attend exercise sessions could have their benefits slashed, in a move proposed by Westminster Council.\nGPs would also be allowed to prescribe leisure activities such as swimming and fitness classes under the idea." },
  { title: "Google's Eric Schmidt plans visit to North Korea", slug: 'eric-schmidt-visit', category: "Politics", tag_list: "google, North Korea", url: "http://news.bbcimg.co.uk/media/images/65054000/jpg/_65054642_schmidt.jpg", content: "The chairman of Google, Eric Schmidt, is planning a visit to North Korea, South Korean officials say.\nThe reason for the trip has not yet been revealed, but news agencies say it is part of a humanitarian mission led by US politician Bill Richardson.\nThe former New Mexico governor has been involved in ad-hoc negotiations with the North Koreans in the last 20 years.\nInternet use is highly restricted there although leader Kim Jong-un has called for a push in technology and science.\nThe South Korean government told news agency AFP that it is aware of the planned visit, adding that the trip is personal.\nGoogle has refused to comment so far." },
  { title: "Pakistan militant Mullah Nazir 'killed in drone attack'", slug: 'mullah-nazir-killed', category: "Politics", tag_list: "Pakistan", url: "http://news.bbcimg.co.uk/media/images/65052000/jpg/_65052037_65052036.jpg", content: "Senior Pakistani militant leader Mullah Nazir has been killed by a US drone strike, security officials say.\nHe died with at least five fighters when two missiles struck his vehicle in the north-west tribal district of South Waziristan, they said.\nHe was the leader of one of four major militant factions in Pakistan, accused of sending fighters to back the Afghan Taliban and fight foreign troops there." }
]

en_news.each do |news|
  category = Category.find_by_name_en news[:category]
  a = Award.find_by_year 2012
  News.create! category_id: category.id, title: news[:title], award_id: a.id,
    content: news[:content], remote_logo_url: news[:url], slug: news[:slug],
    tag_list: news[:tag_list]
end

partners = [
  { name: 'Совет Федерации', logo: "http://www.eurasium.com/images/logo_sovetfeder.gif", url: "http://www.council.gov.ru/" },
  { name: 'Федерал пресс', logo: "http://www.history.nsc.ru/website/history-institute/var/custom/Image/federalpress_logo.jpg", url: "http://fedpress.ru/" }
]

partners.each do |partner|
  Partner.create! name: partner[:name], remote_logo_url: partner[:logo],
    url: partner[:url]
end

en_experts = [
  { last_name: "Biden", first_name: "Joseph", middle_name: "Robinette", category: 'Politics', url: "http://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Joe_Biden_official_portrait_crop.jpg/280px-Joe_Biden_official_portrait_crop.jpg", description: "Joe Biden is the 47th and current Vice President of the United States, jointly elected with President Barack Obama. He is a member of the Democratic Party and was a United States Senator from Delaware from January 3, 1973 until his resignation on January 15, 2009, following his election to the Vice Presidency. In 2012, Biden was elected to a second term alongside Obama.", position: "Vice President of the US", post: "Vice President", workplace: "US Government" },
  { last_name: "Kennedy", first_name: "John", middle_name: "Fitzgerald", category: 'Politics', url: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/JohnFK.png/220px-JohnFK.png", description: "Often referred to by his initials JFK, was the 35th President of the United States, serving from 1961 until his death in 1963.", position: "President of the US", post: "President", workplace: "US Government" },
  { last_name: "Churchill", first_name: "Winston", middle_name: "Leonard", category: 'Politics', url: "http://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Sir_Winston_S_Churchill.jpg/245px-Sir_Winston_S_Churchill.jpg", description: "A British politician, best known for his leadership of the United Kingdom during the Second World War. Widely regarded as one of the greatest wartime leaders of the 20th century, he served as Prime Minister twice (1940–45 and 1951–55). A noted statesman and orator, Churchill was also an officer in the British Army, a historian, a writer, and an artist. He is the only British prime minister to have received the Nobel Prize in Literature and was the first person to be made an Honorary Citizen of the United States.", position: "Prime Minister of the UK", post: "Prime Minister", workplace: "UK Government" }
]

en_experts.each_with_index do |expert, i|
  category = Category.find_by_name_en expert[:category]
  Expert.create! last_name: expert[:last_name], first_name: expert[:first_name],
    middle_name: expert[:middle_name], remote_photo_url: expert[:url],
    description: expert[:description], position: expert[:position], partner_id: i+1,
    category_id: category.id, post: expert[:post], workplace: expert[:workplace]
end

en_opinions = [
  { expert: 'Biden', content: "The United States rejects the notion that NATO’s gain is Russia’s loss, or that Russia’s strength is NATO’s weakness. The last few years have seen a dangerous drift in relations between Russia and the members of our Alliance. It is time — to paraphrase President Obama — it’s time to press the reset button and to revisit the many areas where we can and should be working together with Russia." },
  { expert: 'Kennedy', content: "Tolerance implies no lack of commitment to one’s own beliefs. Rather it condemns the oppression or persecution of others." },
  { expert: 'Churchill', content: "Politics is almost as exciting as war, and quite as dangerous. In war you can only be killed once, but in politics many times." }
]

en_opinions.each do |opinion|
  expert = Expert.find_by_last_name opinion[:expert]
  Opinion.create! content: opinion[:content], expert_id: expert.id
end

en_videos = [
  { title: "Financialization and the World Economy", thumb: "http://i2.ytimg.com/vi/MID0CVgXpVM/mqdefault.jpg", tag: "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/MID0CVgXpVM?rel=0\" frameborder=\"0\" allowfullscreen></iframe>" },
  { title: "Egypt's economy spluttering", thumb: "http://i2.ytimg.com/vi/1CFG7kJvwuc/mqdefault.jpg", tag: "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/1CFG7kJvwuc?rel=0\" frameborder=\"0\" allowfullscreen></iframe>" },
  { title: "PM rebuffs Argentina over Falklands", thumb: "http://i3.ytimg.com/vi/jkfnwT3T7BY/mqdefault.jpg", tag: "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/jkfnwT3T7BY?rel=0\" frameborder=\"0\" allowfullscreen></iframe>" }
]

en_videos.each do |video|
  Video.create! title: video[:title], remote_thumb_url: video[:thumb], tag: video[:tag]
end

AwardCategory.create! title: 'Business-Project of the Year'
expert = Expert.find_by_last_name 'Biden'


I18n.locale = :ru
ru_news = [
  { title: "Больше туристов, больше инвестиций - это часть политики", slug: 'turists-means-investments', category: 'Экономика', tag_list: "инвестиции, туристы", url: "http://rus.db.lv/uploads/thumbnails/scale_380x247/article/0005/41267/147287_ORIGINAL_1332251504.jpg.jpg", content: "Если средний турист тратит 530 евро на человека за поездку, то средний турист из России тратит 1300 евро на человека. Тоже разница чувствуется. И мы будем делать все, чтобы отношения с регионами Российской Федерации, в частности и с Россией в целом, укреплялись. Потому что это выгодно. Это выгодно экономически, но и не стоит скидывать со счетов просто человеческий аспект." },
  { title: "В Госдуму повторно внесен законопроект о СМИ \"иностранных агентах\"", slug: 'gosduma-smi', category: 'Политика', tag_list: "госдума, инвестиции", url: "http://cdn.lenta.ru/images/0000/0004/000000040828/pic_1358265138.jpg", content: "По замыслу автора документа единороса Евгения Федорова, для попадания в эту категорию СМИ необходимо освещать политическую ситуацию в России и получать более половины своих доходов из зарубежных источников." },
  { title: "Россия предъявила Украине таможенно-газовый ультиматум", slug: 'russia-ukraine-ultimatum', category: 'Политика', tag_list: "ультиматум, инвестиции", url: "http://telegraf.com.ua/files/2013/01/ukr-rf-580x290.jpg", content: "\"Нельзя быть чуть-чуть беременным\", - заявил директор департамента МИДа РФ по поводу попыток Киева добиться скидки на газ без вступления в Таможенный союз. Украина пытается получить выгоды и от сотрудничества с РФ, и от интеграции в ЕС. В конце 2012 года на фоне этих противоречий сорвался визит Януковича к Путину." },
  { title: "Убытки мировой экономики из-за катаклизмов составили 160 млрд долларов", slug: 'world-economy-losses', category: 'Экономика', tag_list: "мировая экономика", url: "http://cdn3.img22.rian.ru/images/91706/70/917067069.jpg", content: "Экономический ущерб от природных катаклизмов в мире составил в 2012 году 160 миллиардов долларов, из них 65 миллиардов должны быть возмещены страховыми компаниями, сообщает в четверг немецкая перестраховочная компания Muenchener Rueckversicherung AG (Munich Re).\nЧисло погибших в результате природных катаклизмов составило 9,5 тысяч человек, что существенно меньше, чем в 2011 году, когда жертвами стали почти 30 тысяч человек. Наибольший экономический ущерб причинил ураган \"Сэнди\" в США: 25 миллиардов долларов, что составляет две пятых от общемирового ущерба или 90% по застрахованным случаям. Второе место по нанесенному ущербу занимает длительная летняя засуха в США, которая обошлась экономике в 20 миллиардов долларов (должно быть возмещено около 15-17 миллиардов)." }
]

ru_news.each do |news|
  category = Category.find_by_name_ru news[:category]
  a = Award.find_by_year 2012
  News.create! category_id: category.id, title: news[:title], award_id: a.id,
    content: news[:content], remote_logo_url: news[:url], slug: news[:slug],
    tag_list: news[:tag_list]
end

expert.update_attributes last_name: "Байден", first_name: "Джозеф",
  middle_name: "Робинетт", description: "Американский политик, член демократической партии, 47-й вице-президент США. Вступил в должность одновременно с Бараком Обамой 20 января 2009 года. До избрания вице-президентом был сенатором США от штата Делавэр (с 1973 года).", position: "Вице-президент США", post: "Вице-президент", workplace: "Правительство США"

ru_experts = [
  { last_name: "Гайдар", first_name: "Егор", middle_name: "Тимурович", category: 'Экономика', url: "http://lihoi.ru/images/539.jpg", description: "Авторитетный экономист способный убеждать и следовать своим убеждениям. Созданный по его идее Стабфонд защитил Россию в последний кризис. Его идеями нынешнее правительство руководствуется в попытках привести в адекватность и равновесие пенсионную систему.", position: "Экс-премьер-министр РФ", post: "Экс-премьер-министр", workplace: "Правительство Российской Федерации" },
  { last_name: "Кудрин", first_name: "Алексей", middle_name: "Леонидович", category: 'Экономика', url: "http://img.newsinfo.ru/image/article/4/3/9/2439.jpeg", description: "Российский государственный деятель, бывший министр финансов в российском правительстве с 18 мая 2000 года по 26 сентября 2011 года, что является самым длительным сроком нахождения в данной должности в современной России.", position: "Экс-Министр Финансов РФ", post: "Экс Министр Финансов", workplace: "Министерство финансов РФ" }
]

ru_experts.each_with_index do |expert, i|
  category = Category.find_by_name_ru expert[:category]
  Expert.create! last_name: expert[:last_name], first_name: expert[:first_name],
    middle_name: expert[:middle_name], remote_photo_url: expert[:url],
    description: expert[:description], position: expert[:position], partner_id: i+1,
    category_id: category.id, post: expert[:post], workplace: expert[:workplace]
end

3.times do |i|
  Region.all.each do |region|
    num = 250+Random.rand(400)
    Rating.create! region_id: region.id, value: num, date: (3-i).months.ago
  end
  month = Month.create! month: i.months.ago
  rand_num = Random.rand(6)+1
  rand_num.times do |j|
    id = rand(Expert.unscoped{Expert.count})+1
    MonthlyExpert.create!(month_id: month.id, expert_id: id) rescue nil
  end
end

ru_opinions = [
  { expert: 'Байден', content: "Соединенные Штаты отвергают понятие, что выгодно НАТО – плохо для России, или что сильная Россия – слабость НАТО. В прошедшие годы происходил опасный дрейф в отношениях между Россией и членами нашего альянса. В данное время, перефразируя президента Обаму, пора нажать кнопку перезагрузка и пересмотреть многие области, где мы можем и должны сотрудничать с Россией." },
  { expert: 'Гайдар', content: "Социалистическая индустриализация по природе влияния на экономическое развитие подобна допингу в спорте: позволяет на какой-то отрезок времени форсировать темпы роста, но ценой разрушения саморегулирующих функций организма." },
  { expert: 'Кудрин', content: "Сейчас Россия стоит перед необходимостью создания новой модели роста экономики — не на базе роста спроса, подогретого вливаниями “нефтяных” ресурсов , а на основе роста частных инвестиций, подкрепленного стабильной финансовой системой с низкой инфляцией и низкой ставкой кредитования, наряду с иными институциональными преобразованиями." }
]

ru_opinions.each do |opinion|
  expert = Expert.find_by_last_name opinion[:expert]
  Opinion.create! content: opinion[:content], expert_id: expert.id
end

ru_videos = [
  { title: "Крушение самолета во Внуково.", thumb: "http://i4.ytimg.com/vi/c2brROQMQe0/mqdefault.jpg", tag: "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/c2brROQMQe0?rel=0\" frameborder=\"0\" allowfullscreen></iframe>" },
  { title: "Экономика Британии переживает вторую волну кризиса", thumb: "http://i1.ytimg.com/vi/hirNcR_87eY/mqdefault.jpg", tag: "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/hirNcR_87eY?rel=0\" frameborder=\"0\" allowfullscreen></iframe>" },
  { title: "Экономический кризис: выживем ли мы?", thumb: "http://i2.ytimg.com/vi/A5j930jIGw4/mqdefault.jpg", tag: "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/A5j930jIGw4?rel=0\" frameborder=\"0\" allowfullscreen></iframe>" }
]

ru_videos.each do |video|
  Video.create! title: video[:title], remote_thumb_url: video[:thumb], tag: video[:tag]
end

AwardCategory.first.update_attribute :title, 'Бизнес-проект года'

years = [2012, 2013]
years.each do |year|
  award = Award.find_by_year year
  Nominee.create! award_id: award.id, date: '2012.12.12'.to_date, region_id: 2,
    award_category_id: 1, winner: true, title: "Проект возрождения Амуро-Сибирской магистрали"
  Expert.all.each do |expert|
    Juror.create! award_id: award.id, expert_id: expert.id
  end
end

images = [
  'http://zhkhacker.ru/wp-content/uploads/2013/01/Corbis-42-34954200.jpg',
  'http://www.hotelholidayvenice.com/img/meetings3_b.jpg'
]

award = Award.find_by_year 2013
gallery = Gallery.create! award_id: award.id
images.each do |image|
  Image.create! remote_file_url: image, gallery_id: gallery.id
end
