!pip install opencv-python
# Устанавливаем библиотеку opencv для работы с распознаванием
import cv2
import numpy as np
from matplotlib import pyplot
from IPython import display
from IPython.display import Image
#Импорт библиотек в рабочий проект 
net = cv2.dnn.readNet('yolov3.weights', 'yolov3.cfg')
#Открываем наши файлы с конфигами и весами
with open('coco.names') as f:
#открываем файл с именами объектов, которые можем распознавать
    labels = f.read().strip().split('\n')
#скрипт который читает и запоминает название объекта для распознавания

layer_names = net.getLayerNames()
#присваиваем названия полотну в соответствие с названием из coco.names.
out_layers_indexes_arr = net.getUnconnectedOutLayers()
out_layers_indexes = [index - 1 for index in  ut_layers_indexes_arr]
out_layer_names = [layer_names[index] for index in    out_layers_indexes]
out_layer_namese
#В целом, получаем индексы из наших фалов весов и задаём им номера начиная с единицы.

#В этой части кода рисуем «бокс», в котором у нас будет само распознавание объектов
boxes = [
    [0, 500, 400, 300]
]

def draw_boxes(img):
    color = [255, 0, 0]
    width = 3
    
    for x1, y1, x2, y2 in boxes:
        img = cv2.rectangle(img, (x1, y1), (x2, y2), color, width)
    return img
        
def check_coords(x, y, label):
    if label not in ['broccoli']:
        return False #Если распознанный объект не банан, то возвращается значение ЛОЖЬ и объект не будет распознан
    for x1, y1, x2, y2 in boxes:
        if x1 <= x <= x2 and y1 <= y <= y2:
            return True
    return False
     
def draw_object(img, x, y, w, h, label, success):
    x1, y1 = x - w // 2, y - h // 2
    x2, y2 = x + w // 2, y + h // 2
    color = [0, 255, 0] if success else [0, 0, 255]
    width = 1

    img = cv2.rectangle(img, (x1, y1), (x2, y2), color, width)
    
    font_size = 1
    font = cv2.FONT_HERSHEY_SIMPLEX
    text = label

    img = cv2.putText(img, text, (x1, y1), font, font_size, color, width)
    
    return img


def draw_car_count(img, count): 
    color = [0, 0, 255] 
    width = 2
    font_size = 1
    font = cv2.FONT_HERSHEY_SIMPLEX
    text = ' Broccoli total '

    img = cv2.putText(img, text, (50, 70), font, font_size, color, width)
    
    text = 'broccoli Count ' счётчик ,брокколи + str(count) 
    img = cv2.putText(img, text, (50, 140), font, font_size, color, width)
    
    return img
    


def apply_yolo(img):
    height, width, _ = img.shape
    blob = cv2.dnn.blobFromImage(img, 1/255, (608, 608), (0, 0, 0), swapRB=True)
    net.setInput(blob)
    
    out_layers = net.forward(out_layer_names)
    object_boxes = []
    object_probas = []
    object_labels = []

    for layer in out_layers:
        for result in layer:
            x, y, w, h = result[:4]
            x = int(x * width)
            w = int(w * width)
            y = int(y * height)
            h = int(h * height)
            probas = result[5:]
            max_proba_index = np.argmax(probas)
            max_proba = probas[max_proba_index]
            if max_proba > 0:     
                object_boxes.append([x, y, w, h])
                object_probas.append(float(max_proba))
                object_labels.append(labels[max_proba_index])
                
    filtered_boxes_indexes = cv2.dnn.NMSBoxes(object_boxes, object_probas, 0.0, 0.1)
    img = draw_boxes(img)
    success_count = 0
    for index_arr in filtered_boxes_indexes:
        index = index_arr
        box = object_boxes[index]
        x, y, w, h = box
        success = check_coords(x, y, object_labels[index])
        img = draw_object(img, x, y, w, h, object_labels[index], success)
        if success:
            success_count += 1
    img = draw_car_count(img, success_count)
        
        
    return img

for i in range(10):
    
    cap = cv2.VideoCapture('broccoli.mp4') 

    while cap.isOpened(): 
        ret, frame = cap.read() 
        if not ret:
            break
        
        frame = apply_yolo(frame) 
        	
        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB) 
        
        pyplot.figure(figsize=(20, 15))    
        pyplot.imshow(frame)    
        display.clear_output(wait=True)
        display.display(pyplot.gcf())
        
    cap.release()
