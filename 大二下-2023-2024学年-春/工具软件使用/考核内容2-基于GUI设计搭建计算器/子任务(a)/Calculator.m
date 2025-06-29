function varargout = Calculator(varargin)
% CALCULATOR MATLAB code for Calculator.fig
%      CALCULATOR, by itself, creates a new CALCULATOR or raises the existing
%      singleton*.
%
%      H = CALCULATOR returns the handle to a new CALCULATOR or the handle to
%      the existing singleton*.
%
%      CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATOR.M with the given input arguments.
%
%      CALCULATOR('Property','Value',...) creates a new CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculator

% Last Modified by GUIDE v2.5 30-May-2024 20:59:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Calculator is made visible.
function Calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculator (see VARARGIN)

% Choose default command line output for Calculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_C.
function pushbutton_C_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String',' ');%將文本框設置一個空格字符
guidata(hObject, handles);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_sign.
function pushbutton_sign_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String');% 获取当前编辑框中的字符串
number = str2double(textString);% 将字符串转换为数值
number = -number;% 改变数值的符号
textString = num2str(number);% 将改变符号后的数值转换回字符串
set(handles.edit1,'String',textString);% 显示在编辑框中
guidata(hObject, handles);

% --- Executes on button press in pushbutton_divide.
function pushbutton_divide_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_divide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'/');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_percent.
function pushbutton_percent_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'*100%');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_multiply.
function pushbutton_multiply_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_multiply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'*');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_minus.
function pushbutton_minus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'-');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_plus.
function pushbutton_plus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'+');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_equal.
function pushbutton_equal_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String');
result = eval(textString);%直接計算括號內容
set(handles.edit1,'String',result);
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num7.
function pushbutton_num7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'7');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num8.
function pushbutton_num8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'8');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num9.
function pushbutton_num9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'9');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num4.
function pushbutton_num4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'4');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num5.
function pushbutton_num5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'5');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num6.
function pushbutton_num6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'6');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num1.
function pushbutton_num1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'1');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num0.
function pushbutton_num0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'0');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num2.
function pushbutton_num2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'2');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_num3.
function pushbutton_num3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_num3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'3');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);

% --- Executes on button press in pushbutton_point.
function pushbutton_point_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.edit1,'String'); %獲取可編輯文本框的字符串，並保存在textString中
textString = strcat(textString,'.');%橫向連接字符串
set(handles.edit1,'String',textString);%顯示在可編輯文本框
guidata(hObject, handles);
