## The start

he start consists in 3 easy steps:

    1. Extract the main file into your website (myjson.class.php)
    2. Include the main file
    3. Make new instance (object)

The last 2 steps are coded like this: 
```php
require 'myjson.class.php';
$myxml = new MyJSON;
// That's all!
```

## Creating JSON from MySQL Query

You can create a JSON string from a MySQL query with the **SQLtoJSON** function and 1 or 2 params:

**SQLtoJSON(string $query, bool $indented = false)**

Params:

    1. $query - The mysql query string -required-
    2. $indented - If true, the returned string will be indented - Default: xml

Actions:

    1. Loads new error and returns false on class-failure
    2. Dies on MySQL failure
    2. Returns string on success

Example: 

```php
// Include and create new object
require 'myjson.class.php';
$myjson = new MyJSON;

// Make the connection
$con = mysql_connect('localhost', 'user', 'pass');
mysql_select_db('your_db');

// Get JSON from any query
echo $myjson->SQLtoJSON("SELECT * FROM my_table");


// Try to get a nice indented-json
echo $myjson->SQLtoJSON("SELECT * FROM my_table", true);
```

## Creating MySQL Queries from JSON 

To insert a JSON string into your MySQL Table, you should use the **JSONtoSQL** function:

**JSONtoSQL(string $json, string $table)**

Params:

    1. $json - The json string (indented or not, doesn't matter)
    2. $table - The table where the JSON will be saved.

Actions:

    1. Loads new error and returns false on class-failure
    2. Dies on MySQL failure
    3. Returns true on success

**NOTE:** The JSON fields and the MySQL fields should be the same at the same order! Otherwise the function will load error and return false.
**NOTE 2:** If some fields are 'empty' in the JSON string, in the query will be taked as null. If some fields are numeric, it will not be encapsulated between ' and '.

```php
// Include and new object
require 'myjson.class.php';
$ob = new MyJSON;

// Suponsing my JSON has this syntax:
$json = '[
	{
		"id" : "",
		"title" : "Example"
	},
	{
		"id" : "",
		"title" : "Example 2 here"
	}
]';

// Make the queries
$ob->JSONtoSQL($json, 'my_table');
```

## Getting Errors

If you want to get errors, you should access to the public **errors** var: 

```php
//If the array has more than 0 indexes, there was something wrong
if(count($instance->errors) > 0) {
	echo 'Something went wrong: <br />< br />';
	print_r($instance->errors);
}
```

## Examples

If you go to the /examples/ dir, you can see some directories. Enter to one, import the only SQL file into your MySQl and open the config.php file. Customize it with your MySQL Config and run the run_code.php file.

## Changelog

1.0
23/April/2011
