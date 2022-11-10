Skip to main content
Skip to editor
Skip to results
roles_hierarchy
Home
Updated 1 day ago
Draft
1
-------- Create database and schemas --------
2
​
3
// set context
4
use role sysadmin;
5
​
6
create database btech;
7
​
8
create schema btech.cfg;
9
create schema btech.dwh;
10
create schema btech.dwhp;
11
create schema btech.edw_sar;
12
create schema btech.landing_d365;
13
create schema btech.landing_oms;
14
create schema btech.landing_mag;
15
create schema btech.log;
16
create schema btech.ods_d365;
17
create schema btech.ods_oms;
18
create schema btech.ods_mag;
19
create schema btech.wrk_dwh;
20
create schema btech.wrk_lnd;
21
create schema btech.wrk_ods;
22
​
23
​
24
-------- Create dwhs --------
25
​
26
create warehouse if not exists btech_matillion_wh
27
    warehouse_size = medium
28
    auto_suspend = 60
29
    auto_resume = true
30
    initially_suspended = true;
31
​
32
create warehouse if not exists btech_admistrator_wh
33
    warehouse_size = small
34
    auto_suspend = 60
35
    auto_resume = true
36
    initially_suspended = true;
37
​
38
create warehouse if not exists btech_analyst_wh
39
    warehouse_size = small
40
    auto_suspend = 60
41
    auto_resume = true
42
    initially_suspended = true;
43
​
44
create warehouse if not exists btech_reporting_wh
45
    warehouse_size = xsmall
46
    auto_suspend = 60
47
    auto_resume = true
48
    initially_suspended = true;
49
​
50
-------- Create roles --------
51
​
52
// set context
53
use role securityadmin;
54
​
55
// create roles
56
create role btech_administrator_role;
57
create role btech_matillion_etl_role;
58
create role btech_analyst_role;
59
create role btech_reporting_role;
60
​
61
// create role hierarchy
62
​
63
grant role btech_matillion_etl_role
64
    to role sysadmin;
65
    
66
grant role btech_administrator_role
67
    to role btech_matillion_etl_role;
68
​
69
grant role btech_analyst_role
70
    to role btech_administrator_role;
71
​
72
grant role btech_reporting_role
73
    to role btech_analyst_role;
74
    
75
-------- Grant privileges to admin role --------
76
​
77
// set context
78
use role securityadmin;
79
​
80
// grant admin privileges
81
grant all privileges
82
    on database btech
83
    to role btech_administrator_role;
84
​
85
// grant all privileges on all warehouses   
86
grant all privileges
87
  on warehouse btech_admistrator_wh
88
  to role btech_administrator_role;
89
​
90
grant all privileges
91
  on warehouse btech_matillion_wh
92
  to role btech_administrator_role;
93
  
94
grant all privileges
95
  on warehouse btech_analyst_wh
96
  to role btech_administrator_role;
97
  
98
grant all privileges
99
  on warehouse btech_reporting_wh
100
  to role btech_administrator_role;
101
​
102
grant all privileges
103
  on warehouse btech_egypt_wh
104
  to role btech_administrator_role;
105
​
106
// grant all priviliges on schemas and tables
107
grant all privileges on schema btech.cfg to role btech_administrator_role;
108
grant all privileges on schema btech.dwh to role btech_administrator_role;
109
grant all privileges on schema btech.dwhp to role btech_administrator_role;
110
grant all privileges on schema btech.landing_d365 to role btech_administrator_role;
111
grant all privileges on schema btech.landing_mag to role btech_administrator_role;
112
grant all privileges on schema btech.landing_oms to role btech_administrator_role;
113
grant all privileges on schema btech.log to role btech_administrator_role;
114
grant all privileges on schema btech.utils to role btech_administrator_role;
115
grant all privileges on schema btech.wrk_dwh to role btech_administrator_role;
116
grant all privileges on schema btech.wrk_lnd to role btech_administrator_role;
117
grant all privileges on schema btech.wrk_ods to role btech_administrator_role;
118
grant all privileges on schema btech.ods_d365 to role btech_administrator_role;
119
grant all privileges on schema btech.ods_mag to role btech_administrator_role;
120
grant all privileges on schema btech.ods_oms to role btech_administrator_role;
121
grant all privileges on schema btech.analysis_magento to role btech_administrator_role;
122
​
123
grant all privileges on future tables in schema btech.cfg to role btech_administrator_role;
124
grant all privileges on future tables in schema btech.dwh to role btech_administrator_role;
125
grant all privileges on future tables in schema btech.dwhp to role btech_administrator_role;
126
grant all privileges on future tables in schema btech.landing_d365 to role btech_administrator_role;
127
grant all privileges on future tables in schema btech.landing_mag to role btech_administrator_role;
128
grant all privileges on future tables in schema btech.landing_oms to role btech_administrator_role;
129
grant all privileges on future tables in schema btech.log to role btech_administrator_role;
130
grant all privileges on future tables in schema btech.utils to role btech_administrator_role;
131
grant all privileges on future tables in schema btech.wrk_dwh to role btech_administrator_role;
132
grant all privileges on future tables in schema btech.wrk_lnd to role btech_administrator_role;
133
grant all privileges on future tables in schema btech.wrk_ods to role btech_administrator_role;
134
grant all privileges on future tables in schema btech.ods_d365 to role btech_administrator_role;
135
grant all privileges on future tables in schema btech.ods_mag to role btech_administrator_role;
136
grant all privileges on future tables in schema btech.ods_oms to role btech_administrator_role;
137
grant all privileges on future tables in schema btech.analysis_magento to role btech_administrator_role;
138
​
139
grant all privileges on all tables in schema btech.cfg to role btech_administrator_role;
140
grant all privileges on all tables in schema btech.dwh to role btech_administrator_role;
141
grant all privileges on all tables in schema btech.dwhp to role btech_administrator_role;
142
grant all privileges on all tables in schema btech.landing_d365 to role btech_administrator_role;
143
grant all privileges on all tables in schema btech.landing_mag to role btech_administrator_role;
144
grant all privileges on all tables in schema btech.landing_oms to role btech_administrator_role;
145
grant all privileges on all tables in schema btech.log to role btech_administrator_role;
146
grant all privileges on all tables in schema btech.ods_d365 to role btech_administrator_role;
147
grant all privileges on all tables in schema btech.ods_mag to role btech_administrator_role;
148
grant all privileges on all tables in schema btech.ods_oms to role btech_administrator_role;
149
grant all privileges on all tables in schema btech.utils to role btech_administrator_role;
150
grant all privileges on all tables in schema btech.wrk_dwh to role btech_administrator_role;
151
grant all privileges on all tables in schema btech.wrk_lnd to role btech_administrator_role;
152
grant all privileges on all tables in schema btech.wrk_ods to role btech_administrator_role;
153
grant all privileges on all tables in schema btech.analysis_magento to role btech_administrator_role;
154
​
155
-------- Grant privileges to reporting role --------
156
​
157
// grant read only privileges on btech.dwhp tables to reporting role
158
// https://docs.snowflake.com/en/user-guide/security-access-control-configure.html#creating-custom-read-only-roles
159
​
160
grant usage
161
  on database btech
162
  to role btech_reporting_role;
163
​
164
grant usage
165
  on schema btech.dwhp
166
  to role btech_reporting_role;
167
  
168
grant select
169
  on all tables in schema btech.dwhp
170
  to role btech_reporting_role;
171
​
172
grant select
173
  on future tables in schema btech.dwhp
174
  to role btech_reporting_role;
175
​
176
grant usage
177
  on warehouse btech_reporting_wh
178
  to role btech_reporting_role;
179
  
180
  
181
-------- Grant privileges to analyst role --------
182
​
183
grant usage
184
  on database btech
185
  to role btech_analyst_role;
186
  
187
grant usage on schema btech.cfg to role btech_analyst_role;
188
grant usage on schema btech.dwh to role btech_analyst_role;
189
grant usage on schema btech.dwhp to role btech_analyst_role;
190
grant usage on schema btech.landing_d365 to role btech_analyst_role;
191
grant usage on schema btech.landing_mag to role btech_analyst_role;
192
grant usage on schema btech.landing_oms to role btech_analyst_role;
193
grant usage on schema btech.log to role btech_analyst_role;
194
grant usage on schema btech.ods_d365 to role btech_analyst_role;
195
grant usage on schema btech.ods_mag to role btech_analyst_role;
196
grant usage on schema btech.ods_oms to role btech_analyst_role;
197
grant usage on schema btech.utils to role btech_analyst_role;
198
grant usage on schema btech.wrk_dwh to role btech_analyst_role;
199
grant usage on schema btech.wrk_lnd to role btech_analyst_role;
200
grant usage on schema btech.wrk_ods to role btech_analyst_role;
201
grant usage on schema btech.analysis_magento to role btech_analyst_role;
202
​
203
​
204
grant select on future tables in schema btech.cfg to role btech_analyst_role;
205
grant select on future tables in schema btech.dwh to role btech_analyst_role;
206
grant select on future tables in schema btech.dwhp to role btech_analyst_role;
207
grant select on future tables in schema btech.landing_d365 to role btech_analyst_role;
208
grant select on future tables in schema btech.landing_mag to role btech_analyst_role;
209
grant select on future tables in schema btech.landing_oms to role btech_analyst_role;
210
grant select on future tables in schema btech.log to role btech_analyst_role;
211
grant select on future tables in schema btech.ods_d365 to role btech_analyst_role;
212
grant select on future tables in schema btech.ods_mag to role btech_analyst_role;
213
grant select on future tables in schema btech.ods_oms to role btech_analyst_role;
214
grant select on future tables in schema btech.utils to role btech_analyst_role;
215
grant select on future tables in schema btech.wrk_dwh to role btech_analyst_role;
216
grant select on future tables in schema btech.wrk_lnd to role btech_analyst_role;
217
grant select on future tables in schema btech.wrk_ods to role btech_analyst_role;
218
grant select on future tables in schema btech.analysis_magento to role btech_analyst_role;
219
​
220
​
221
grant select on all tables in schema btech.cfg to role btech_analyst_role;
222
grant select on all tables in schema btech.dwh to role btech_analyst_role;
223
grant select on all tables in schema btech.dwhp to role btech_analyst_role;
224
grant select on all tables in schema btech.landing_d365 to role btech_analyst_role;
225
grant select on all tables in schema btech.landing_mag to role btech_analyst_role;
226
grant select on all tables in schema btech.landing_oms to role btech_analyst_role;
227
grant select on all tables in schema btech.log to role btech_analyst_role;
228
grant select on all tables in schema btech.ods_d365 to role btech_analyst_role;
229
grant select on all tables in schema btech.ods_mag to role btech_analyst_role;
230
grant select on all tables in schema btech.ods_oms to role btech_analyst_role;
231
grant select on all tables in schema btech.utils to role btech_analyst_role;
232
grant select on all tables in schema btech.wrk_dwh to role btech_analyst_role;
233
grant select on all tables in schema btech.wrk_lnd to role btech_analyst_role;
234
grant select on all tables in schema btech.wrk_ods to role btech_analyst_role;
235
grant select on all tables in schema btech.analysis_magento to role btech_analyst_role;
236
​
237
grant usage
238
  on warehouse btech_analyst_wh
239
  to role btech_analyst_role;
240
​
241
​
242
-------- Grant privileges to matillion role --------
243
​
244
grant usage
245
  on warehouse btech_matillion_wh
246
  to role btech_matillion_etl_role;
247
​
248
-------- Create users and grant created roles to them --------
249
​
250
// set context
251
use role securityadmin;
252
​
253
// create users
254
call btech.utils.create_user('daniele', 'frigo', 'daniele.frigo@sdggroup.com', 'btech', 'BTECH_ADMINISTRATOR_ROLE', 'BTECH_ADMINISTRATOR_WH');
255
call btech.utils.create_user('fabio', 'valvano', 'fabio.valvano@sdggroup.com', 'btech', 'BTECH_ADMINISTRATOR_ROLE', 'BTECH_ADMINISTRATOR_WH');
256
call btech.utils.create_user('cristina', 'polo', 'cristinaines.polo@sdggroup.com', 'btech', 'BTECH_ADMINISTRATOR_ROLE', 'BTECH_ADMINISTRATOR_WH');
257
call btech.utils.create_user('gregorio', 'vettori', 'gregorio.vettori@sdggroup.com', 'btech', 'BTECH_ADMINISTRATOR_ROLE', 'BTECH_ADMINISTRATOR_WH');
258
call btech.utils.create_user('raul', 'riva', 'raulfabio.riva@sdggroup.com', 'btech', 'BTECH_ADMINISTRATOR_ROLE', 'BTECH_ADMINISTRATOR_WH');
259
call btech.utils.create_user('paolo', 'formici', 'paolo.formici@sdggroup.com', 'btech', 'BTECH_ADMINISTRATOR_ROLE', 'BTECH_ADMINISTRATOR_WH');
260
call btech.utils.create_user('reporting_user', 'btech', 'BTECH_REPORTING_ROLE', 'BTECH_REPORTING_WH');
261
​
262
// create matillion user
263
call btech.utils.create_user('matillion_user', 'btech', 'MATILLION_ETL_ROLE', 'BTECH_MATILLION_WH');
264
​
265
// create egypt users
266
call btech.utils.create_user('walid', 'youssif', 'waild.youssif@sdggroup.com', 'btech', 'BTECH_ANALYST_ROLE', 'BTECH_ANALYST_WH');
267
call btech.utils.create_user('ahmed', 'alaa', 'ahmed.alaa@sdggroup.com', 'btech', 'BTECH_ANALYST_ROLE', 'BTECH_ANALYST_WH');
268
call btech.utils.create_user('ahmed', 'hozayen', 'ahmed.hozayen@sdggroup.com', 'btech', 'BTECH_ANALYST_ROLE', 'BTECH_ANALYST_WH');
269
call btech.utils.create_user('hany', 'naguib', 'hany.naguib@sdggroup.com', 'btech', 'BTECH_ANALYST_ROLE', 'BTECH_ANALYST_WH');
270
​
271
revoke role btech_administrator_role from user paoloformici;
272
​
273
​
274
​
275
grant create table on schema btech.analysis_magento to role btech_analyst_role;
276
grant create view on schema btech.analysis_magento to role btech_analyst_role;
277
​
278
​
279
​
Entire tablestatus
Result row 1Statement executed successfully.
Result row 2
Query Details
Query duration
386ms
Rows
1
status
Aa
28 Queries
ROW CLICK ACTION
Table data loaded
Worksheets
Databases
Search

Sorted by descending