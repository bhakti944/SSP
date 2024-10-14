import java.rmi.*;
import java.rmi.server.*;
public class MathsOper extends UnicastRemoteObject implements Math
{
  MathsOper() throws RemoteException
{ super(); }
  public int add(int a , int b)
{  return (a+b); }
 public int sub(int a , int b)
{ return (a-b); }
 public int div(int a , int b)
{  return (a/b); }
 public int mul(int a , int b)
{  return (a*b); }
}
