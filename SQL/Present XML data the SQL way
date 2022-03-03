SELECT
  (xpath('/user/first_name/text()', data))[1]::text as first_name,
  (xpath('/user/last_name/text()', data))[1]::text as last_name,
  date_part('year', age(((xpath('/user/date_of_birth/text()', data))[1]::text)::date))::int as age,
  CASE
    WHEN (xpath('/user/private/text()', data))[1]::text = 'true' then 'Hidden'
    WHEN not xpath_exists('/user/email_addresses/address', data) then 'None'
    ELSE (xpath('/user/email_addresses/address/text()', data))[1]
  END as email_address
FROM unnest(xpath('/data/user', (select data from users limit 1))) as data
ORDER BY first_name, last_name;
