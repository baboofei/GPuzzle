// File : GPIO.pde
// Author : Claude Luo <luot17@kua.org>
// Description : I/O Library for GPuzzle, read / write data from file / database / other data providers

public interface DataProvider
{
	//	Data Provider provides data
}

public interface JobController
{
	//	Job Controller handles jobs and decide how to 
	//	manipulate the data
}

public class LocalFile implements DataProvider
{

}

public class SQLDatabase implements DataProvider
{

}

public class GenericJobController implements JobController
{

}

public class EnormousJobController implements JobController
{

}

public class TestJobController implements JobController
{

}
