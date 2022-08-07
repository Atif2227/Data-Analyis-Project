/* Create unit product cost (upc) table*/
create table upc as (select product_code, avg(sales_amount)*0.66 as upc from transactions group by product_code);
select * from upc;

/* Create new transactions table with upc column */
create table new_transactions as (
select upc.product_code,customer_code, market_code, market_name, order_date, sales_qty, upc.upc, sales_amount, currency, zone
from transactions
join upc
on transactions.product_code = upc.product_code
where transactions.product_code = upc.product_code);

/* Calculate net profit */
Select sum(sales_amount), sum(upc), sum(sales_amount)-sum(upc) as net_profit from new_transactions;

select * from new_transactions;

/* Select top product w.r.t. sales amount */
select product_code, sum(sales_amount) from new_transactions group by product_code order by sum(sales_amount) desc;

/*  Insert pruduct type column */
alter table new_transactions add column product_type varchar (20) after product_code;

/* Insert the value of product_type */
update
    new_transactions
set
    product_type = 'Injectable'
where
    product_code in ('Prod318',
'Prod324',
'Prod329',
'Prod316',
'Prod334',
'Prod332',
'Prod040',
'Prod319',
'Prod304',
'Prod159',
'Prod339',
'Prod310',
'Prod065',
'Prod326',
'Prod018',
'Prod053',
'Prod306',
'Prod090',
'Prod060',
'Prod328',
'Prod102',
'Prod327',
'Prod239',
'Prod049',
'Prod129',
'Prod099',
'Prod024',
'Prod245',
'Prod320',
'Prod117',
'Prod308',
'Prod252',
'Prod209',
'Prod131',
'Prod337',
'Prod166',
'Prod057',
'Prod237',
'Prod313',
'Prod113',
'Prod212',
'Prod061',
'Prod047',
'Prod106',
'Prod123',
'Prod167',
'Prod215',
'Prod133',
'Prod307',
'Prod210',
'Prod214',
'Prod206',
'Prod044',
'Prod046',
'Prod052',
'Prod243',
'Prod236',
'Prod105',
'Prod261',
'Prod232',
'Prod216',
'Prod054',
'Prod121',
'Prod336',
'Prod071',
'Prod267',
'Prod260',
'Prod058',
'Prod077',
'Prod220',
'Prod221',
'Prod290',
'Prod312',
'Prod246',
'Prod271',
'Prod165',
'Prod043',
'Prod292',
'Prod056',
'Prod070',
'Prod116',
'Prod093',
'Prod213',
'Prod160',
'Prod244',
'Prod298',
'Prod025',
'Prod251',
'Prod241',
'Prod016',
'Prod134',
'Prod229',
'Prod254',
'Prod322',
'Prod150',
'Prod297',
'Prod126',
'Prod110',
'Prod145',
'Prod227'
);

update
    new_transactions
set
    product_type = 'Tablet'
where
    product_code in (
        'Prod146',
'Prod098',
'Prod124',
'Prod051',
'Prod338',
'Prod169',
'Prod120',
'Prod073',
'Prod062',
'Prod288',
'Prod114',
'Prod233',
'Prod187',
'Prod333',
'Prod325',
'Prod296',
'Prod042',
'Prod286',
'Prod005',
'Prod101',
'Prod321',
'Prod162',
'Prod122',
'Prod204',
'Prod317',
'Prod323',
'Prod255',
'Prod225',
'Prod045',
'Prod294',
'Prod161',
'Prod084',
'Prod030',
'Prod091',
'Prod234',
'Prod089',
'Prod135',
'Prod170',
'Prod238',
'Prod309',
'Prod132',
'Prod103',
'Prod228',
'Prod072',
'Prod295',
'Prod250',
'Prod100',
'Prod148',
'Prod083',
'Prod003',
'Prod300',
'Prod258',
'Prod283',
'Prod128',
'Prod180',
'Prod168',
'Prod067',
'Prod127',
'Prod279',
'Prod059',
'Prod092',
'Prod017',
'Prod280',
'Prod152',
'Prod163',
'Prod118',
'Prod013',
'Prod269',
'Prod048',
'Prod311',
'Prod265',
'Prod303',
'Prod041',
'Prod177',
'Prod164',
'Prod137',
'Prod179',
'Prod149',
'Prod278',
'Prod275'
    );
    
    update
    new_transactions
set
    product_type = 'Syrup'
where
    product_code in (
        'Prod039',
'Prod119',
'Prod176',
'Prod026',
'Prod188',
'Prod249',
'Prod270',
'Prod033',
'Prod095',
'Prod021',
'Prod281',
'Prod064',
'Prod301',
'Prod178',
'Prod331',
'Prod011',
'Prod199',
'Prod140',
'Prod141',
'Prod293',
'Prod266',
'Prod068',
'Prod055',
'Prod268',
'Prod289',
'Prod087',
'Prod305',
'Prod291',
'Prod107',
'Prod276',
'Prod263',
'Prod010',
'Prod088',
'Prod020',
'Prod224',
'Prod257',
'Prod207',
'Prod242',
'Prod218',
'Prod143',
'Prod264',
'Prod185',
'Prod262',
'Prod330',
'Prod158',
'Prod302',
'Prod272',
'Prod144',
'Prod253',
'Prod274',
'Prod273',
'Prod205',
'Prod085',
'Prod226',
'Prod287',
'Prod147',
'Prod142',
'Prod125',
'Prod019',
'Prod009',
'Prod096',
'Prod219',
'Prod081',
'Prod197',
'Prod208',
'Prod193',
'Prod186',
'Prod315',
'Prod201',
'Prod157',
'Prod172',
'Prod171',
'Prod284',
'Prod038',
'Prod174',
'Prod027',
'Prod001',
'Prod223',
'Prod183',
'Prod104',
'Prod314',
'Prod153',
'Prod198',
'Prod231',
'Prod004',
'Prod012',
'Prod097',
'Prod022',
'Prod195',
'Prod196',
'Prod035',
'Prod184',
'Prod028',
'Prod156',
'Prod139',
'Prod155',
'Prod086',
'Prod023'
    );
    
    SELECT * FROM new_transactions;

update
    new_transactions
set
    product_type = 'Ointment'
where
    product_code in (
        'Prod203',
'Prod008',
'Prod136',
'Prod031',
'Prod015',
'Prod080',
'Prod285',
'Prod138',
'Prod034',
'Prod202',
'Prod235',
'Prod036',
'Prod191',
'Prod050',
'Prod002',
'Prod078',
'Prod190',
'Prod192',
'Prod063',
'Prod032',
'Prod335',
'Prod130',
'Prod079',
'Prod094'
    );
    
SELECT * FROM new_transactions;

update
    new_transactions
set
    product_type = 'Powder'
where
    product_code in (
        'Prod173',
        'Prod007',
        'Prod200',
        'Prod259',
        'Prod006',
        'Prod014',
        'Prod112',
        'Prod075',
        'Prod248',
        'Prod182',
        'Prod074',
        'Prod211',
        'Prod066',
        'Prod277',
        'Prod189',
        'Prod109',
        'Prod029',
        'Prod217',
        'Prod175',
        'Prod194',
        'Prod069',
        'Prod282',
        'Prod037',
        'Prod108',
        'Prod076',
        'Prod082',
        'Prod240',
        'Prod222',
        'Prod256',
        'Prod230',
        'Prod151',
        'Prod247',
        'Prod154',
        'Prod181',
        'Prod115',
        'Prod111',
        'Prod299' 
    );
    
select distinct sum(sales_amount),product_type from new_transactions group by product_type order by sum(sales_amount) desc;

/* Create Table new_products */
create table new_product as( select product_code, product_type from new_transactions);

/* Check the new table new_product */
select * from new_product;

create table customers as (
select customer_code, market_code, market_name, zone 
from new_transactions group by customer_code);