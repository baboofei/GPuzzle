public interface GObject
{
	
}

public interface GCollection
{
	GObject[] GetCollection(int indexShift, int endian);
}

public class GSegment implements GObject, GCollection
{
	public final GByte[] Bytes;
	public final long[] ByteHashes;

	//TODO: Class GSegment	
	public GSegment(GByte[] bytes)
	{
	}
}

public class GSentence implements GObject, GCollection
{
	public ArrayList<GByte> Bytes;
	public ArrayList<long> BytesHashes;
	
	public float Hash;

	public GSentence(GBytes[] bytes)
	{

		//TODO:	Constructor for GSentence
	}

	public GObject[] GetCollection(int indexShift, int endian)
	{
		if(endian == ENDIAN_LOW)
		{
			GByte[] bytesCollection = GByte[this.Bytes.length - indexShift];
			for(int i = indexShift; i < this.Bytes.length; ++i)
			{
				bytesCollection[i] = this.Bytes[i]
			}	
			return bytesCollection;
		}
		else if(endian == ENDIAN_HIGH)
		{
			GByte[] bytesCollection = GByte[this.Bytes.length - indexShift];
			for(int i = this.Bytes.length - indexShift; i > 0; --i)
			{
				bytesCollection[i] = this.Bytes[i];
			}
			
			return bytesCollection;
		}
		else
		{
			GByte[] bytesCollection = GByte[this.Bytes.length]
			for(int i = 0; i < this.Bytes.length; ++i)
			{
				bytesCollection[i] = this.Bytes[i]
			}
			
			return bytesCollection;
		}
	}

	public void Merge(GSentence otherSentence, unsigned int indexShift, int endian)
	{
		//	TODO: Merge this with otherSentence
		newBytes = new ArrayList<GBytes>;		

		switch(endian)
		{
			case ENDIAN_LOW:		
				for(int i = 0; i < indexShift; ++i)
				{
					newBytes[i] = this.Bytes[i];
				}
				for(int i = indexShift; i < indexShift + otherSentence.Bytes.length; ++i)
				{
					
				}
		}
	}

	public int Search(GSentence otherSentence)
	{
		//	TODO: If this consists of otherSentence, return index of first byte of otherSentence in this
		//	Else return -1
	}

	public int FastSearch(GSentence otherSentence)
	{
		//	TODO: Quickly search using hashes
	}

	public float Diff(GSentence otherSentence, unsigned int indexShift, int endian)
	{
		//	TODO: Returns the similarity of the part of this and otherSentence specified by indexShift and mode
	}

	public float FastDiff(GSentence otherSentence, unsigned int indexShift, int endian)
	{
		//	TODO: Quickly diff using hashes, note this will not consider how different the bytes are, just if they are identical or not
	}
}

public class GByte implements GObject
{
	public final GBit[] Bits;
	public final int BitsSize;
	
	public final long Hash;

	public GByte(GBit[] bits)
	{
		this.Bits = bits;
		this.BitsSize = bits.length;
	}
	
	public bool Equals(GByte otherByte)
	{
		if(this.BitsSize == otherByte.BitsSize)
		{
			return this.Bits.Equals(otherByte.Bits);
		}
		else
		{
			return false;
		}
	}

	public bool FastEquals(GByte otherByte)
	{
		return this.Hash == otherByte.Hash;
	}

	public float Diff(GByte otherByte)
	{
		//	returns 0 - 1 similarity of two GBytes,
		//	if otherByte consists of the sequence of this, returns 1
		//	if this consists of the sequence of otherByte, returns otherByte.BitsSize / this.BitsSize

		int identicalBitsCount;

		for(int i = 0; i < this.BitsSize; ++i)
		{
			if(this.Bits[i].Base == otherByte.Bits[i].Base)
			{
				++identicalBitsCount;
			}	
		}

		return float(identicalBitsCount / this.BitsSize);
	}
}

public class GBit implements GObject
{
	public final int Base;

	public GBit(int base)
	{
		this.Base = base;
	}
}

final int GB_A = 0x00;
final int GB_T = 0xf0;
final int GB_C = 0x0f;
final int GB_G = 0xff;
final int ENDIAN_LOW = -1;
final int ENDIAN_HIGH = 1;
