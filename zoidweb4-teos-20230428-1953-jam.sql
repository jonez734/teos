--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10
-- Dumped by pg_dump version 13.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: __sig; Type: TABLE; Schema: engine; Owner: jam
--

CREATE TABLE engine.__sig (
    id integer NOT NULL,
    name text,
    intro text,
    parentid integer,
    path public.ltree,
    title text,
    syncnumber integer,
    lastmodified timestamp with time zone,
    lastmodifiedbyid integer,
    dateposted timestamp with time zone,
    postedbyid integer
);


ALTER TABLE engine.__sig OWNER TO jam;

--
-- Name: sig_id_seq; Type: SEQUENCE; Schema: engine; Owner: jam
--

CREATE SEQUENCE engine.sig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE engine.sig_id_seq OWNER TO jam;

--
-- Name: sig_id_seq; Type: SEQUENCE OWNED BY; Schema: engine; Owner: jam
--

ALTER SEQUENCE engine.sig_id_seq OWNED BY engine.__sig.id;


--
-- Name: __sig id; Type: DEFAULT; Schema: engine; Owner: jam
--

ALTER TABLE ONLY engine.__sig ALTER COLUMN id SET DEFAULT nextval('engine.sig_id_seq'::regclass);


--
-- Data for Name: __sig; Type: TABLE DATA; Schema: engine; Owner: jam
--

COPY engine.__sig (id, name, intro, parentid, path, title, syncnumber, lastmodified, lastmodifiedbyid, dateposted, postedbyid) FROM stdin;
162	str8	\N	158	top.eros.str8	straight	229	\N	\N	\N	\N
101	gtk	\N	105	top.computers.graphics.gtk	gtk+	127	\N	\N	\N	\N
125	bbs-engine	\N	124	top.project_eros.bbs_engine	bbs engine	128	\N	\N	\N	\N
88	measurements-and-units	\N	16	top.science.measurements_and_units	measurements and units	129	\N	\N	\N	\N
29	medical-information-resources	\N	16	top.science.medical_information_resources	medical information resources	130	\N	\N	\N	\N
61	astronomy	\N	16	top.science.astronomy	astronomy	131	\N	\N	\N	\N
116	science-fiction	\N	18	top.entertainment.science_fiction	science fiction	133	\N	\N	\N	\N
26	music	\N	18	top.entertainment.music	music	135	\N	\N	\N	\N
123	rhps	\N	18	top.entertainment.rhps	rhps	136	\N	\N	\N	\N
135	knight-rider	\N	18	top.entertainment.knight_rider	knight rider	137	\N	\N	\N	\N
138	mst3k	\N	18	top.entertainment.mst3k	mst3k	138	\N	\N	\N	\N
143	mud	\N	18	top.entertainment.mud	mud	139	\N	\N	\N	\N
57	postgresql	\N	55	top.computers.database_management_systems_dbms.postgresql	postgresql	140	\N	\N	\N	\N
76	sql	\N	55	top.computers.database_management_systems_dbms.sql	sql	141	\N	\N	\N	\N
127	open-source-in-k12	\N	144	top.computers.opensource.open_source_in_k12	open source in k12	142	\N	\N	\N	\N
11	linux	\N	144	top.computers.opensource.linux	linux	143	\N	\N	\N	\N
10	unix-like	\N	144	top.computers.opensource.unix_like	unix-like	144	\N	\N	\N	\N
73	humor	\N	20	top.society_culture.humor	humor	145	\N	\N	\N	\N
21	religion-spirituality	\N	20	top.society_culture.religion_spirituality	religion & spirituality	146	\N	\N	\N	\N
25	body-modification	\N	20	top.society_culture.body_modification	body modification	147	\N	\N	\N	\N
122	small-business	\N	\N	top.small_business	small business	149	\N	\N	\N	\N
3	news-media	\N	\N	top.news_media	news & media	150	\N	\N	\N	\N
42	arts	\N	\N	top.arts	arts	152	\N	\N	\N	\N
129	politics	\N	\N	top.politics	politics	153	\N	\N	\N	\N
132	home-automation	\N	\N	top.home_automation	home automation	154	\N	\N	\N	\N
139	health	\N	\N	top.health	health	155	\N	\N	\N	\N
142	guestbook	\N	\N	top.guestbook	guestbook	156	\N	\N	\N	\N
145	computers	\N	\N	top.computers	computers	157	\N	\N	\N	\N
60	people	\N	\N	top.people	people	158	\N	\N	\N	\N
16	science	\N	\N	top.science	science	160	\N	\N	\N	\N
108	irc-internet-relay-chat	\N	50	top.computers.communications_and_networking.irc_internet_relay_chat	irc - internet relay chat	162	\N	\N	\N	\N
52	ntp-network-time-protocol	\N	50	top.computers.communications_and_networking.ntp_network_time_protocol	ntp - network time protocol	163	\N	\N	\N	\N
128	voip	\N	50	top.computers.communications_and_networking.voip	voip	164	\N	\N	\N	\N
133	ipv6	\N	50	top.computers.communications_and_networking.ipv6	ipv6	165	\N	\N	\N	\N
134	hardware	\N	145	top.computers.hardware	hardware	167	\N	\N	\N	\N
4	programming	\N	145	top.computers.programming	programming	168	\N	\N	\N	\N
131	c64	\N	145	top.computers.c64	c64	169	\N	\N	\N	\N
81	concurrent-version-system	\N	145	top.computers.concurrent_version_system	concurrent version system	170	\N	\N	\N	\N
9	operating-systems	\N	145	top.computers.operating_systems	operating systems	172	\N	\N	\N	\N
109	history	\N	145	top.computers.history	history	173	\N	\N	\N	\N
144	opensource	\N	145	top.computers.opensource	opensource	174	\N	\N	\N	\N
95	rfcs	\N	145	top.computers.rfcs	rfcs	176	\N	\N	\N	\N
130	digital-media	\N	145	top.computers.digital_media	digital media	178	\N	\N	\N	\N
117	fyis	\N	145	top.computers.fyis	fyis	180	\N	\N	\N	\N
59	hacking	\N	145	top.computers.hacking	hacking	181	\N	\N	\N	\N
105	graphics	\N	145	top.computers.graphics	graphics	182	\N	\N	\N	\N
106	animation	\N	42	top.arts.animation	animation	184	\N	\N	\N	\N
113	music	\N	42	top.arts.music	music	185	\N	\N	\N	\N
5	python	\N	4	top.computers.programming.python	python	187	\N	\N	\N	\N
6	perl	\N	4	top.computers.programming.perl	perl	188	\N	\N	\N	\N
7	php	\N	4	top.computers.programming.php	php	189	\N	\N	\N	\N
146	javascript	\N	4	top.computers.programming.javascript	javascript	190	\N	\N	\N	\N
31	windows-nt	\N	9	top.computers.operating_systems.windows_nt	windows nt	191	\N	\N	\N	\N
107	anime	\N	106	top.arts.animation.anime	anime	192	\N	\N	\N	\N
22	faiths-practices	\N	21	top.society_culture.religion_spirituality.faiths_practices	faiths & practices	194	\N	\N	\N	\N
141	pythongeneral	\N	5	top.computers.programming.python.pythongeneral	pythongeneral	195	\N	\N	\N	\N
140	phpgeneral	\N	7	top.computers.programming.php.phpgeneral	phpgeneral	196	\N	\N	\N	\N
119	drugs	\N	20	top.health.drugs	drugs	148	2014-08-30 14:14:23.48162-04	1	\N	\N
41	apache-httpd	\N	145	top.www.apache_httpd	apache httpd	171	2016-09-10 19:53:17.616206-04	1	\N	\N
94	network-management	\N	145	top.communications_and_networking.network_management	network management	166	2016-09-10 19:56:17.104626-04	1	\N	\N
90	games	\N	\N	top.entertainment.games	games	159	2016-09-28 18:40:03.100223-04	1	\N	\N
28	software	\N	11	top.computers.opensource.linux.software	software	197	\N	\N	\N	\N
136	fedora-project	\N	11	top.computers.opensource.linux.fedora_project	fedora project	198	\N	\N	\N	\N
91	role-playing	\N	90	top.games.role_playing	role playing	199	\N	\N	\N	\N
17	paranormal	\N	16	top.paranormal	paranormal	132	2019-03-17 02:22:11.269161-04	1	\N	\N
27	tablature	\N	26	top.entertainment.music.tablature	tablature	200	\N	\N	\N	\N
92	d20-system	\N	91	top.games.role_playing.d20_system	d20 system	202	\N	\N	\N	\N
62	radio-astronomy	\N	61	top.science.astronomy.radio_astronomy	radio astronomy	203	\N	\N	\N	\N
89	conversion	\N	88	top.science.measurements_and_units.conversion	conversion	205	\N	\N	\N	\N
152	nascar	\N	150	top.sports.nascar	nascar	209	\N	\N	\N	\N
151	postfix	\N	144	top.computers.opensource.postfix	postfix	210	\N	\N	\N	\N
148	professional-wrestling	\N	18	top.entertainment.professional_wrestling	professional wrestling	211	\N	\N	\N	\N
149	karaoke	\N	18	top.entertainment.karaoke	karaoke	212	\N	\N	\N	\N
157	educational-resources	\N	16	top.science.educational_resources	educational resources	213	\N	\N	\N	\N
20	society-culture	\N	\N	top.society_culture	society & culture	214	\N	\N	\N	\N
156	whiskey-tango-foxtrot	\N	\N	top.whiskey_tango_foxtrot	whiskey tango foxtrot	219	\N	\N	\N	\N
55	database-management-systems-dbms	\N	145	top.computers.database_management_systems_dbms	database management systems (dbms)	220	\N	\N	\N	\N
153	games	\N	145	top.computers.games	games	221	\N	\N	\N	\N
161	taboo	\N	158	top.eros.taboo	taboo	225	\N	\N	\N	\N
124	zoid-web	\N	\N	top.zoid_web	zoid web	228	\N	\N	\N	\N
166	cams	\N	\N	top.eros.cams	cams	\N	2014-08-02 13:56:59.14546-04	1	2014-08-02 13:56:59.14546-04	1
167	sites	\N	\N	top.eros.sites	sites	\N	2014-08-02 14:01:01.065858-04	1	2014-08-02 14:01:01.065858-04	1
168	sites	\N	\N	top.eros.gay.sites	sites	\N	2014-08-02 14:27:38.978922-04	1	2014-08-02 14:27:38.978922-04	1
169	swim	\N	\N	top.eros.gay.swim	swim	\N	2014-08-02 14:32:42.795522-04	1	2014-08-02 14:32:42.795522-04	1
170	mil	\N	\N	top.eros.gay.mil	military	\N	2014-08-02 14:35:42.728731-04	1	2014-08-02 14:35:42.728731-04	1
158	eros	\N	\N	top.eros	eros (adult content)	230	2014-08-02 15:53:35.82366-04	1	\N	\N
180	fmradio	online fm radio station streams that suck less[trade].	\N	top.entertainment.fmradio	fm radio	\N	2015-06-23 18:24:41.366112-04	1	2015-06-23 18:24:41.366112-04	1
120	military	\N	\N	top.military	military	215	2014-08-22 15:47:03.531925-04	1	\N	\N
172	massage	\N	\N	top.eros.gay.massage	massage	\N	2014-08-02 18:51:57.364491-04	1	2014-08-02 18:51:57.364491-04	1
173	outdoor	\N	\N	top.eros.gay.outdoor	outdoor	\N	2014-08-02 19:01:36.390536-04	1	2014-08-02 19:01:36.390536-04	1
171	med	\N	\N	top.eros.gay.med	doctor	\N	2014-08-03 00:10:20.569294-04	1	2014-08-02 14:49:46.166006-04	1
174	nutrition	\N	\N	top.health.nutrition	nutrition	\N	2014-08-05 21:05:24.358321-04	1	2014-08-05 21:05:24.358321-04	1
163	twink	\N	\N	top.eros.gay.twink	twink	\N	2014-08-09 13:27:24.271947-04	1	\N	\N
175	cumshots	\N	\N	top.eros.gay.cumshots	cumshots	\N	2014-08-09 13:37:32.513604-04	1	2014-08-09 13:37:32.513604-04	1
18	entertainment	\N	\N	top.entertainment	entertainment	161	2014-08-30 12:41:38.414132-04	1	\N	\N
154	technology	\N	\N	top.technology	technology	217	2014-08-22 00:16:44.536982-04	1	\N	\N
178	handjobs	\N	\N	top.eros.gay.handjobs	handjobs	\N	2014-10-28 11:12:52.711859-04	1	2014-10-28 11:12:52.711859-04	1
179	college	\N	\N	top.eros.gay.college	college	\N	2014-12-21 19:13:51.084214-05	1	2014-12-21 19:13:51.084214-05	1
159	gay	\N	158	top.eros.gay	gay	223	2014-08-22 01:41:24.52998-04	1	\N	\N
160	bi	\N	158	top.eros.bi	bi	224	2014-12-29 07:10:02.349997-05	1	\N	\N
150	sports	\N	\N	top.sports	sports	216	2014-08-22 02:01:51.817297-04	1	\N	\N
181	css	\N	\N	top.www.css	css - cascading style sheets	\N	2015-06-30 20:31:21.088355-04	1	2015-06-30 20:31:21.088355-04	1
182	sitenews	\N	\N	top.sitenews	site news	\N	2015-07-03 22:58:34.447037-04	1	2015-07-03 22:58:34.447037-04	1
155	travel	\N	\N	top.travel	travel	218	2015-07-23 17:52:40.832659-04	1	\N	\N
111	www	[p]this sig is for all things world-wide-web[/p]	145	top.www	world wide web	175	2015-09-16 14:26:14.240077-04	1	\N	\N
186	culinary	...of or for cooking	\N	top.arts.culinary	culinary	\N	2015-10-22 14:07:10.176561-04	1	2015-10-22 14:07:10.176561-04	1
176	agt	\N	\N	top.entertainment.agt	america's got talent	\N	2017-01-24 22:24:43.968263-05	1	2014-08-10 16:58:51.301621-04	1
185	teos	\N	\N	top	zoidweb	\N	\N	\N	\N	\N
188	2016	[p]selected [i]worthy[/i] acts from AGT Season 11 (2016)[/p]	\N	top.entertainment.agt.2016	2016 (season 11)	\N	2016-07-27 08:55:32.139512-04	1	2016-06-09 21:56:44.359788-04	1
165	solo-male	\N	\N	top.eros.solo_male	solo male	\N	2016-10-04 12:20:14.471143-04	1	2014-08-02 13:54:49.622734-04	1
184	preprocessors	\N	\N	top.www.css.preprocessors	preprocessors	\N	2017-01-28 22:06:30.806462-05	1	2015-07-22 20:21:25.542532-04	1
137	stargate-sg-1	\N	116	top.entertainment.science_fiction.stargate_sg_1	stargate sg-1	201	2017-04-21 00:25:04.512297-04	1	\N	\N
187	jeffmacdonaldcase	\N	\N	top.society_culture.justice.jeffmacdonaldcase	dr. jeffrey macdonald case	\N	2016-09-10 16:07:14.79087-04	1	2016-03-20 22:58:39.214494-04	1
189	season10	[p]season 10, 2015[/p]	\N	top.entertainment.agt.season10	2015 (season 10)	\N	2016-07-27 20:24:45.282926-04	1	2016-07-27 20:24:45.282926-04	1
190	season09	\N	\N	top.entertainment.agt.season09	2014 (season 9)	\N	2016-07-27 20:29:08.865586-04	1	2016-07-27 20:29:08.865586-04	1
191	season06	\N	\N	top.entertainment.agt.season06	2011 (season 6)	\N	2016-07-27 20:38:28.845135-04	1	2016-07-27 20:36:49.785108-04	1
192	season07	\N	\N	top.entertainment.agt.season07	2012 (season 7)	\N	2016-07-27 20:52:55.731137-04	1	2016-07-27 20:48:18.635695-04	1
193	bgt	\N	\N	top.entertainment.bgt	britain's got talent	\N	2016-07-27 21:10:57.570083-04	1	2016-07-27 21:09:48.389632-04	1
194	iot	\N	\N	top.iot	internet of things	\N	2016-08-26 22:54:23.183082-04	1	2016-08-26 22:54:23.183082-04	1
195	pinball	\N	\N	top.entertainment.pinball	pinball	\N	2016-08-27 00:12:36.471068-04	1	2016-08-27 00:12:36.471068-04	1
197	cons	\N	\N	top.computers.hacking.cons	conferences	\N	2016-09-10 16:40:48.908104-04	1	2016-09-10 16:40:48.908104-04	1
50	communications-and-networking	\N	145	top.communications_and_networking	communications and networking	179	2016-09-10 19:51:57.351691-04	1	\N	\N
198	college	\N	\N	top.society_culture.college	college	\N	2016-09-14 18:15:15.948461-04	1	2016-09-14 18:15:15.948461-04	1
199	lockerroom	[p]nothing wrong with studying how guys shower![/p]	\N	top.eros.gay.lockerroom	locker room	\N	2016-10-02 01:15:41.362167-04	1	2016-10-02 01:12:10.610121-04	1
201	jo	\N	\N	top.eros.gay.jo	jo	\N	2016-10-03 17:07:32.261752-04	1	2016-10-03 17:07:32.261752-04	1
203	tor	\N	\N	top.computers.security.tor	the onion router (tor)	\N	2016-11-09 23:41:05.658384-05	1	2016-11-09 23:41:05.658384-05	1
177	achilles	[p]this sig is for information about mono-sodium glutamate (MSG, manufactured free glutamic acid)  and the affects it has on the human body, as well as info about [link:https://medlineplus.gov/ency/article/001126.htm]Chinese Restaurant Syndrome (CRS)[/link][/p]	\N	top.achilles	achilles	\N	2016-12-07 22:13:25.737565-05	1	2014-09-03 20:05:19.458511-04	1
102	security	[p]this sig is for computer and personal security issues.[/p]	145	top.security	security	177	2018-02-23 23:46:54.093322-05	1	\N	\N
126	911	[p]this sig is not only about the events of [link:https://en.wikipedia.org/wiki/September_11_attacks]september 11 attacks[/link]. it is also about items that might cause [link:https://en.wikipedia.org/wiki/Spock]Spock[/link] to raise a single eyebrow.[/p]	20	top.911	911	183	2016-12-09 22:34:29.040273-05	1	\N	\N
204	ted	\N	\N	top.technology.ted	TED and TEDx talks	\N	2016-12-23 20:12:28.789243-05	1	2016-12-23 18:36:02.083215-05	1
205	copperfield	\N	\N	top.entertainment.magic.copperfield	david copperfield	\N	2017-01-16 22:31:40.046343-05	1	2017-01-16 22:31:40.046343-05	1
206	trendz	\N	\N	top.www.trendz	trendz	\N	2017-02-24 23:07:04.38843-05	1	2017-02-24 23:07:04.38843-05	1
207	2017	\N	\N	top.entertainment.agt.2017	2017 (season 12)	\N	2017-06-25 21:27:06.709222-04	1	2017-06-25 21:27:06.709222-04	1
212	cryptocurrency	\N	\N	top.cryptocurrency	cryptocurrency	\N	2018-03-07 20:57:59.311986-05	1	2018-03-07 20:57:59.311986-05	1
213	agora	\N	\N	top.agora	agora	\N	2018-03-29 20:01:46.627174-04	1	2018-03-29 20:01:46.627174-04	1
208	x-factor	\N	\N	top.entertainment.x_factor	x factor	\N	2017-08-23 02:30:29.301624-04	1	2017-08-23 02:19:20.625008-04	1
209	the-voice	\N	\N	top.entertainment.the_voice	the voice	\N	2017-09-10 01:24:55.096475-04	1	2017-09-10 01:24:55.096475-04	1
210	cryptocurrency	\N	\N	top.technology.cryptocurrency	cryptocurrency	\N	2018-01-07 14:33:27.752615-05	1	2018-01-07 14:33:27.752615-05	1
211	demos	\N	\N	top.computers.c64.demos	demos	\N	2018-01-24 01:10:34.677192-05	1	2018-01-24 01:10:34.677192-05	1
200	penn-teller-fool-us	[link:http://cwtv.com/shows/penn-teller-fool-us/]penn teller fool us on cwtv[/link]	\N	top.entertainment.magic.penn_teller_fool_us	penn & teller: fool us	\N	2018-05-08 23:43:11.374704-04	1	2016-10-02 23:32:35.878097-04	1
214	fraud-scam-tracking	\N	\N	top.security.fraud_scam_tracking	fraud/scam tracking sites	\N	2018-05-18 20:48:23.55728-04	1	2018-05-18 20:48:23.55728-04	1
215	season13	\N	\N	top.entertainment.agt.season13	2018 (season 13)	\N	2018-06-08 19:04:33.815576-04	1	2018-06-08 19:04:33.815576-04	1
216	bigdicks	\N	\N	top.eros.gay.bigdicks	bigdicks	\N	2018-06-22 19:40:04.280829-04	1	2018-06-22 19:40:04.280829-04	1
217	qc	\N	\N	top.computers.qc	quantum computing	\N	2018-07-09 20:06:39.537211-04	1	2018-07-09 20:06:39.537211-04	1
196	justice	\N	\N	top.society_culture.justice	justice	\N	2018-07-18 19:23:32.530442-04	1	2016-09-10 16:05:39.982132-04	1
218	zodiac	\N	\N	top.society_culture.justice.zodiac	zodiac	\N	2018-07-18 19:51:28.265469-04	1	2018-07-18 19:51:28.265469-04	1
219	social-media	\N	\N	top.www.social_media	social media	\N	2018-08-16 21:50:01.174688-04	1	2018-08-16 21:50:01.174688-04	1
220	buddies	\N	\N	top.eros.gay.jo.buddies	buddies	\N	2018-08-19 22:52:54.384296-04	1	2018-08-19 22:52:54.384296-04	1
221	cons	\N	\N	top.cons	conventions	\N	2018-08-24 01:05:18.475091-04	1	2018-08-24 01:05:18.475091-04	1
222	hope	\N	\N	top.cons.hope	hackers on planet earth (hope)	\N	2018-08-24 01:06:34.51869-04	1	2018-08-24 01:06:34.51869-04	1
223	defcon	\N	\N	top.cons.defcon	defcon	\N	2018-08-24 01:33:45.157095-04	1	2018-08-24 01:33:45.157095-04	1
224	openttd	an open source simulation game based upon Transport Tycoon Deluxe	\N	top.entertainment.games.openttd	openttd	\N	2018-09-02 00:43:36.412109-04	1	2018-09-02 00:38:06.088357-04	1
225	sesame-street	\N	\N	top.entertainment.sesame_street	sesame street	\N	2018-09-18 02:31:09.44727-04	1	2018-09-18 02:31:09.44727-04	1
202	ed	[h1]"call me ed"[/h1]\r\n[p]ed snowden is, in my mind, a patriot and a whistle blower regarding some intelligence community programs that are unconstitutional and lack meaningful oversight.[/p]\r\n[p]I do my best to link to things that will let my readers make up their own mind about this issue.[/p]\r\n\r\n[p]if any of these links disclose classified information, please contact me and I will correct the situation[/p]	\N	top.911.ed	ed	\N	2018-09-29 01:47:22.452211-04	1	2016-10-12 00:54:33.135577-04	1
226	nkotb	\N	\N	top.entertainment.nkotb	nkotb	\N	2018-11-24 22:23:04.339262-05	1	2018-11-24 22:23:04.339262-05	1
227	mash	\N	\N	top.entertainment.mash	M*A*S*H	\N	2019-01-16 20:37:27.546925-05	1	2019-01-16 20:37:27.546925-05	1
228	tds	\N	\N	top.entertainment.tds	the daily show	\N	2019-01-16 22:41:02.397202-05	1	2019-01-16 22:41:02.397202-05	1
229	blender	\N	\N	top.computers.graphics.blender	blender	\N	2019-02-04 23:25:12.140568-05	1	2019-02-04 23:25:12.140568-05	1
121	john-edward	\N	17	top.paranormal.john_edward	john edward	204	2019-03-17 02:23:35.670002-04	1	\N	\N
230	recipes	\N	\N	top.recipes	Recipes	\N	2019-05-06 23:32:40.363262-04	1	2019-05-06 23:32:40.363262-04	1
231	season14	\N	\N	top.entertainment.agt.season14	2019 (season 14)	\N	2019-05-28 21:30:21.884222-04	1	2019-05-28 21:29:32.643794-04	1
232	elvenar	\N	\N	top.entertainment.games.elvenar	elvenar	\N	2019-06-13 01:00:37.667318-04	1	2019-06-13 01:00:37.667318-04	1
233	self-suck	\N	\N	top.eros.gay.self_suck	Self Suck	\N	2019-06-16 03:19:18.377693-04	1	2019-06-16 03:19:18.377693-04	1
234	psyche	\N	\N	top.psyche	psyche	\N	2019-07-17 22:10:56.034825-04	1	2019-07-17 20:09:40.886251-04	1
236	movies	\N	\N	top.entertainment.movies	movies	\N	2019-09-03 01:02:24.805941-04	1	2019-09-03 01:02:24.805941-04	1
237	star-trek	\N	\N	top.entertainment.star_trek	star trek	\N	2019-09-12 00:21:26.025711-04	1	2019-09-12 00:21:26.025711-04	1
238	hypno	\N	\N	top.eros.gay.hypno	hypno	\N	2019-09-15 16:01:21.607604-04	1	2019-09-15 16:01:21.607604-04	1
239	jeff-dunham	\N	\N	top.entertainment.jeff_dunham	jeff dunham	\N	2019-11-23 23:09:56.01274-05	1	2019-11-23 23:09:56.01274-05	1
235	007	\N	\N	top.entertainment.007	james bond 007	\N	2019-11-23 23:46:40.753165-05	1	2019-08-02 01:09:12.724867-04	1
240	a-closer-look	\N	\N	top.politics.a_closer_look	late night w seth meyers: a closer look	\N	2019-11-27 22:44:51.280341-05	1	2019-11-27 22:44:51.280341-05	1
241	2020	<p>The 2020 American Election</p>\r\n<p>&nbsp;</p>	\N	top.politics.2020	2020	\N	2020-01-06 21:56:43.058894-05	1	2020-01-06 21:56:43.058894-05	1
242	corvid2019	\N	\N	top.health.corvid2019	covid 19 corona virus 2020	\N	2020-03-17 20:47:01.823632-04	1	2020-03-17 20:47:01.823632-04	1
243	covid-19	\N	\N	top.health.covid_19	covid-19	\N	2020-03-23 14:37:33.992901-04	1	2020-03-23 14:37:33.992901-04	1
244	consumer-protection	\N	\N	top.consumer_protection	consumer protection	\N	2020-03-28 21:24:39.051845-04	1	2020-03-28 21:24:39.051845-04	1
245	comedy	\N	\N	top.entertainment.comedy	comedy	\N	2020-04-17 12:28:16.960549-04	1	2020-04-17 12:28:16.960549-04	1
246	drama	\N	\N	top.entertainment.drama	drama	\N	2020-04-19 19:31:31.552331-04	1	2020-04-19 19:31:31.552331-04	1
247	sports	\N	\N	top.entertainment.sports	sports	\N	2020-04-19 20:22:36.771353-04	1	2020-04-19 20:22:36.771353-04	1
248	crime	\N	\N	top.entertainment.crime	crime	\N	2020-04-19 21:42:30.422031-04	1	2020-04-19 21:42:30.422031-04	1
249	documentary	\N	\N	top.entertainment.documentary	documentary	\N	2020-04-20 14:10:50.699809-04	1	2020-04-20 14:10:50.699809-04	1
250	mystery	\N	\N	top.entertainment.mystery	mystery	\N	2020-04-20 14:12:05.851411-04	1	2020-04-20 14:12:05.851411-04	1
251	thriller	\N	\N	top.entertainment.thriller	thriller	\N	2020-04-20 14:13:15.293524-04	1	2020-04-20 14:13:15.293524-04	1
252	fantasy	\N	\N	top.entertainment.fantasy	fantasy	\N	2020-04-20 14:17:03.13943-04	1	2020-04-20 14:17:03.13943-04	1
253	horror	\N	\N	top.entertainment.horror	horror	\N	2020-04-20 14:22:54.905055-04	1	2020-04-20 14:22:54.905055-04	1
254	action	\N	\N	top.entertainment.action	action	\N	2020-04-20 14:57:42.717364-04	1	2020-04-20 14:57:42.717364-04	1
255	family	\N	\N	top.entertainment.family	family	\N	2020-04-20 20:18:33.998149-04	1	2020-04-20 20:18:33.998149-04	1
256	adventure	\N	\N	top.entertainment.adventure	adventure	\N	2020-04-20 20:52:28.71636-04	1	2020-04-20 20:52:28.71636-04	1
257	marvel	\N	\N	top.entertainment.marvel	marvel	\N	2020-04-20 21:22:58.676388-04	1	2020-04-20 21:22:11.022156-04	1
258	space	\N	\N	top.science.space	space	\N	2020-06-01 21:37:24.587987-04	1	2020-06-01 21:37:24.587987-04	1
260	cher	\N	\N	top.entertainment.music.cher	cher	\N	2020-06-24 23:06:26.763819-04	1	2020-06-24 23:06:26.763819-04	1
261	the-king-of-pop	\N	\N	top.entertainment.music.the_king_of_pop	the king of pop	\N	2020-09-26 13:31:52.729722-04	1	2020-09-26 13:31:52.729722-04	1
262	time-travel	movies, shows, links pertaining to time travel	\N	top.entertainment.time_travel	time travel	\N	2020-10-14 19:34:34.080859-04	1	2020-10-14 19:34:34.080859-04	1
263	musical	\N	\N	top.entertainment.musical	musical	\N	2020-10-27 22:05:03.814488-04	1	2020-10-27 22:05:03.814488-04	1
264	imagebbs	\N	\N	top.computers.c64.imagebbs	imagebbs	\N	2020-12-15 21:35:12.556976-05	1	2020-12-15 21:35:12.556976-05	1
265	the-matrix	\N	\N	top.entertainment.the_matrix	the matrix	\N	2020-12-23 17:01:29.058686-05	1	2020-12-23 17:01:29.058686-05	1
266	2021	\N	\N	top.politics.2021	2021	\N	2021-01-25 15:10:20.232658-05	1	2021-01-25 15:10:20.232658-05	1
267	bts	\N	\N	top.entertainment.bts	behind the scenes	\N	2021-05-09 21:40:59.003692-04	1	2021-05-09 21:40:59.003692-04	1
268	fourth-wall	behind the scenes	\N	top.entertainment.fourth_wall	the fourth wall	\N	2021-05-14 20:27:20.559276-04	1	2021-05-14 20:27:20.559276-04	1
269	lego	LEGO and related technologies	\N	top.entertainment.lego	LEGO	\N	2021-05-29 21:52:46.077723-04	1	2021-05-29 21:52:46.077723-04	1
270	history	\N	\N	top.history	history	\N	2021-06-05 00:20:00.499928-04	1	2021-06-05 00:20:00.499928-04	1
271	puzzles	\N	\N	top.entertainment.puzzles	puzzles	\N	2021-06-08 23:51:30.609956-04	1	2021-06-08 23:51:30.609956-04	1
259	season15	\N	\N	top.entertainment.agt.season15	2020 (season 15)	\N	2021-06-19 00:22:46.222199-04	1	2020-06-15 12:01:36.303746-04	1
272	season16	\N	\N	top.entertainment.agt.season16	2021 (season 16)	\N	2021-06-19 00:23:33.565763-04	1	2021-06-19 00:21:34.583333-04	1
19	magic	[p]I do card tricks to improve manual dexterity and gain a bit of showmanship in the process. I renewed my membership in the [link:http://magicsam.com]SAM[/link] in 2021. I am a fan of "[link:http://projectmagic.org/]project magic[/link]"[/p]	18	top.entertainment.magic	magic	134	2021-06-30 15:54:55.075433-04	1	\N	\N
273	bte	\N	\N	top.entertainment.magic.bte	Big Trick Energy | truTV	\N	2021-06-30 15:56:50.839103-04	1	2021-06-30 15:56:50.839103-04	1
274	casino	\N	\N	top.entertainment.casino	casino	\N	2021-07-26 19:54:01.750962-04	1	2021-07-26 19:54:01.750962-04	1
275	retro	\N	\N	top.computers.retro	retro computing	\N	2021-08-22 19:33:47.856857-04	1	2021-08-22 19:33:47.856857-04	1
276	msr	"Magic's Biggest Secrets Finally Revealed"	\N	top.entertainment.magic.msr	magic's secrets revealed	\N	2021-08-23 23:43:53.750683-04	1	2021-08-23 23:43:53.750683-04	1
277	larrylawton	\N	\N	top.entertainment.larrylawton	larry lawton	\N	2021-08-26 01:45:03.997671-04	1	2021-08-26 01:45:03.997671-04	1
278	kitboga	h/t ian	\N	top.entertainment.kitboga	kitboga	\N	2021-08-26 02:14:39.640382-04	1	2021-08-26 02:14:39.640382-04	1
\.


--
-- Name: sig_id_seq; Type: SEQUENCE SET; Schema: engine; Owner: jam
--

SELECT pg_catalog.setval('engine.sig_id_seq', 278, true);


--
-- Name: __sig idx_sig_path; Type: CONSTRAINT; Schema: engine; Owner: jam
--

ALTER TABLE ONLY engine.__sig
    ADD CONSTRAINT idx_sig_path UNIQUE (path);


--
-- Name: __sig sig_pkey; Type: CONSTRAINT; Schema: engine; Owner: jam
--

ALTER TABLE ONLY engine.__sig
    ADD CONSTRAINT sig_pkey PRIMARY KEY (id);


--
-- Name: idx_sig_gist; Type: INDEX; Schema: engine; Owner: jam
--

CREATE INDEX idx_sig_gist ON engine.__sig USING gist (path);


--
-- Name: __sig fk_sig_lastmodifiedbyid; Type: FK CONSTRAINT; Schema: engine; Owner: jam
--

ALTER TABLE ONLY engine.__sig
    ADD CONSTRAINT fk_sig_lastmodifiedbyid FOREIGN KEY (lastmodifiedbyid) REFERENCES engine.__member(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: __sig fk_sig_parentid; Type: FK CONSTRAINT; Schema: engine; Owner: jam
--

ALTER TABLE ONLY engine.__sig
    ADD CONSTRAINT fk_sig_parentid FOREIGN KEY (parentid) REFERENCES engine.__sig(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: __sig fk_sig_postedbyid; Type: FK CONSTRAINT; Schema: engine; Owner: jam
--

ALTER TABLE ONLY engine.__sig
    ADD CONSTRAINT fk_sig_postedbyid FOREIGN KEY (postedbyid) REFERENCES engine.__member(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: TABLE __sig; Type: ACL; Schema: engine; Owner: jam
--

GRANT ALL ON TABLE engine.__sig TO apache;


--
-- Name: SEQUENCE sig_id_seq; Type: ACL; Schema: engine; Owner: jam
--

GRANT ALL ON SEQUENCE engine.sig_id_seq TO apache;


--
-- PostgreSQL database dump complete
--

