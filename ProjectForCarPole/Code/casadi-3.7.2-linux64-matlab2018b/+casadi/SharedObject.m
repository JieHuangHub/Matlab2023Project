classdef  SharedObject < casadi.GenSharedObject
    %SHAREDOBJECT [INTERNAL] 
    %
    %
    % GenericShared implements a reference counting framework similar
    % for efficient and.
    %
    %easily-maintained memory management.
    %
    %To use the class, both the  GenericShared class (the public class), and the 
    %GenericSharedInternal class (the 
    %internal class) must be inherited from. It
    % can be done in two 
    %different files and together with memory management, 
    %this approach 
    %provides a clear distinction of which methods of the class 
    %are to be 
    %considered "public", i.e. methods for public use that can be 
    %
    %considered to remain over time with small changes, and the internal 
    %memory.
    %
    %When interfacing a software, which typically includes including some 
    %header
    % file, this is best done only in the file where the internal 
    %class is 
    %defined, to avoid polluting the global namespace and other 
    %side effects.
    %
    %The default constructor always means creating a null pointer to an 
    %internal
    % class only. To allocate an internal class (this works only 
    %when the 
    %internal class isn't abstract), use the constructor with 
    %arguments.
    %
    %The copy constructor and the assignment operator perform shallow 
    %copies 
    %only, to make a deep copy you must use the clone method 
    %explicitly. This 
    %will give a shared pointer instance.
    %
    %In an inheritance hierarchy, you can cast down automatically, e.g. 
    %
    %(SXFunction is a child class of  Function): SXFunction derived(...);  
    %Function base = derived;
    %
    %To cast up, use the shared_cast template function, which works 
    %analogously 
    %to dynamic_cast, static_cast, const_cast etc, e.g.: 
    %SXFunction 
    %derived(...);  Function base = derived; SXFunction derived_from_base = 
    %
    %shared_cast<SXFunction>(base);
    %
    %A failed shared_cast will result in a null pointer (cf. dynamic_cast)
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_as
    %
    %C++ includes: shared_object.hpp
    %
    %
  methods
    function varargout = class_name(self,varargin)
    %CLASS_NAME [INTERNAL] 
    %
    %  char = CLASS_NAME(self)
    %
    %Get class name.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_au
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/shared_object.hpp#L85
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/shared_object.cpp#L31-L33
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(34, self, varargin{:});
    end
    function varargout = disp(self,varargin)
    %DISP [INTERNAL] 
    %
    %  std::ostream & = DISP(self, bool more)
    %
    %Print a description of the object.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/shared_object.hpp#L88
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/shared_object.cpp#L35-L41
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(35, self, varargin{:});
    end
    function varargout = str(self,varargin)
    %STR [INTERNAL] 
    %
    %  char = STR(self, bool more)
    %
    %Get string representation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/shared_object.hpp#L91
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/shared_object.hpp#L91-L95
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(36, self, varargin{:});
    end
    function varargout = print_ptr(self,varargin)
    %PRINT_PTR 
    %
    %  std::ostream & = PRINT_PTR(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(37, self, varargin{:});
    end
    function self = SharedObject(varargin)
    %SHAREDOBJECT 
    %
    %  new_obj = SHAREDOBJECT()
    %
    %
      self@casadi.GenSharedObject(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(38, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(39, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
