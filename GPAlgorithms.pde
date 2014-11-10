//	Generic algorithms

public interface SchemaProvider
{
}

public abstract class SortingProvider implements SchemaProvider
{

}

public abstract class QueueProvider implements SchemaProvider
{
	int GetQueueSize();
	int GetQueueSizeMax();
	void Enqueue(QueueObject object);
}

public interface QueueMember
{
	public int UpdatePriority();
	public int SetPriority(int priority);
	public int GetPriority();
}

public abstract class HashProvider implements SchemaProvider
{
	byte[] Hash(byte[] input);
}
